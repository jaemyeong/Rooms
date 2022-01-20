import UIKit

import os

public final class MainViewController: UIViewController {
    private var contentView: MainView {
        self.view as! MainView
    }
    
    private var dataSource: UITableViewDiffableDataSource<Int, Store>?
    
    public override func loadView() {
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let snapshot = NSDiffableDataSourceSnapshot<Int, Store>()
        
        let dataSource = UITableViewDiffableDataSource<Int, Store>(tableView: self.contentView.tableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: type(of: itemIdentifier)), for: indexPath)
            
            itemIdentifier.configureCell(cell)
            
            return cell
        }
        dataSource.apply(snapshot, animatingDifferences: false)
        
        self.dataSource = dataSource
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Task.detached {
            let action = GetStoreList(groupCode: "FVFWKW")
            
            let storeList: [Store]
            
            do {
                storeList = try await action()
            } catch {
                os_log(.error, "%@", String(describing: error))
                
                return
            }
            
            Task.detached { @MainActor in
                var snapshot = NSDiffableDataSourceSnapshot<Int, Store>()
                snapshot.appendSections([0])
                snapshot.appendItems(storeList, toSection: 0)
                
                guard let dataSource = self.dataSource else {
                    return
                }
                dataSource.apply(snapshot)
            }
        }
    }
}
