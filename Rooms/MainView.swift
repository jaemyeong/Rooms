import UIKit

import ErrorKit

public final class MainView: UIView {
    public let tableView: UITableView
    
    public override init(frame: CGRect) {
        self.tableView = UITableView(frame: frame, style: .plain)
        
        super.init(frame: frame)
        
        self.configure()
        self.configureTableView()
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}

extension MainView {
    private func configure() {
        self.backgroundColor = .systemBackground
    }
    
    private func configureTableView() {
        let refreshControl = UIRefreshControl()
        
        let tableView = self.tableView
        tableView.register(StoreTableViewCell.self, forCellReuseIdentifier: String(describing: Store.self))
        tableView.refreshControl = refreshControl
    }
    
    private func configureViewHierarchies() {
        let tableView = self.tableView
        
        self.addSubview(tableView)
    }
    
    private func configureLayoutConstraints() {
        let tableView = self.tableView
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
    }
}
