import UIKit

import os

public final class MainViewController: UIViewController {
    private var contentView: MainView {
        self.view as! MainView
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, Store>?
    
    public override func loadView() {
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("#회의실", comment: "")
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
        ]
        
        let dataSource = UICollectionViewDiffableDataSource<Int, Store>(collectionView: self.contentView.collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: type(of: itemIdentifier)), for: indexPath)
            
            itemIdentifier.configureCell(cell)
            
            return cell
        }
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: UICollectionReusableView.self), for: indexPath)
            
            return supplementaryView
        }
        
        self.dataSource = dataSource
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Task.detached {
            let action = GetStoreList(groupCode: "FVFWKW")
            
            let items: [Store]
            
            do {
                items = try await action()
            } catch {
                os_log(.error, "%@", String(describing: error))
                
                return
            }
            
            await self.reloadData(items: items)
        }
    }
}

extension MainViewController {
    private func reloadData(items: [Store]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Store>()
        snapshot.appendSections([0])
        snapshot.appendItems(items, toSection: 0)
        
        guard let dataSource = self.dataSource else {
            return
        }
        dataSource.apply(snapshot, animatingDifferences: dataSource.snapshot().numberOfSections != 0)
    }
}
