import UIKit

import os

public final class MainViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<Store, Product>?
    
    private var reloadDataTask: Task<Void, Never>? {
        willSet {
            guard let reloadDataTask = self.reloadDataTask else {
                return
            }
            reloadDataTask.cancel()
        }
    }
    
    private var contentView: MainView {
        self.view as! MainView
    }
    
    public override func loadView() {
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("#회의실", comment: "")
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(Self.profileButtonTapped(_:)))
        ]
        
        let dataSource = UICollectionViewDiffableDataSource<Store, Product>(collectionView: self.contentView.collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: type(of: itemIdentifier)), for: indexPath)
            
            if let cell = cell as? ProductCollectionViewCell {
                cell.textLabel.text = itemIdentifier.name
                cell.subtitleLabel.text = .localizedStringWithFormat(NSLocalizedString("최대 %@", comment: ""), itemIdentifier.subtitle)
            }
            
            return cell
        }
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self = self else {
                return nil
            }
            
            guard let store = self.dataSource?.snapshot().sectionIdentifiers[indexPath.section] else {
                return nil
            }
            
            let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: Store.self), for: indexPath)
            
            if let supplementaryView = supplementaryView as? StoreCollectionSupplementaryView {
                supplementaryView.textLabel.text = store.name
            }
            
            return supplementaryView
        }
        
        self.dataSource = dataSource
        
        if let refreshControl = self.contentView.collectionView.refreshControl {
            if #available(iOS 14.0, *) {
                let refreshAction = UIAction { action in
                    if let refreshControl = action.sender as? UIRefreshControl {
                        self.reloadDataTask = Task {
                            await self.reloadData()
                            
                            refreshControl.endRefreshing()
                        }
                    }
                }
                
                refreshControl.addAction(refreshAction, for: .valueChanged)
            } else {
                refreshControl.addTarget(self, action: #selector(Self.handleRefreshControl(_:)), for: .valueChanged)
            }
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.reloadDataTask = Task {
            await self.reloadData()
        }
    }
}

extension MainViewController {
    private func reloadData() async {
        guard let groupCode = UserDefaults.standard.string(forKey: "GroupCode") else {
            return
        }
        
        let action = GetStoreList(groupCode: groupCode)
        
        let items: [Store]
        
        do {
            items = try await action()
        } catch {
            os_log(.error, "%@", String(describing: error))
            
            return
        }
        
        if Task.isCancelled {
            return
        }
        
        self.apply(items: items)
    }
    
    private func apply(items: [Store]) {
        var snapshot = NSDiffableDataSourceSnapshot<Store, Product>()
        
        items.forEach { item in
            snapshot.appendSections([item])
            snapshot.appendItems(item.products, toSection: item)
        }
        
        guard let dataSource = self.dataSource else {
            return
        }
        
        dataSource.apply(snapshot, animatingDifferences: dataSource.snapshot().numberOfSections != 0)
    }
}

extension MainViewController {
    @objc
    private func handleRefreshControl(_ sender: UIRefreshControl) {
        self.reloadDataTask = Task {
            await self.reloadData()
            
            sender.endRefreshing()
        }
    }
    
    @objc
    private func profileButtonTapped(_ sender: UIBarButtonItem) {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        guard UIApplication.shared.canOpenURL(url) else {
            return
        }
        
        UIApplication.shared.open(url)
    }
}
