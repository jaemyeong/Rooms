import UIKit

import os

import Pretendard

import ErrorKit

public final class StoreCollectionSupplementaryView: UICollectionReusableView {
    public let textLabel: UILabel
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        self.configure()
        self.configureTextLabel()
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}

extension StoreCollectionSupplementaryView {
    private func configure() {
        self.backgroundColor = .systemBackground
    }
    
    private func configureTextLabel() {
        let textLabel = self.textLabel
        
        do {
            textLabel.font = try .pretendardFont(ofSize: 20.0, weight: .regular)
        } catch {
            os_log(.error, "%@", String(describing: error))
            
            textLabel.font = .systemFont(ofSize: 20.0, weight: .regular)
        }
        
        textLabel.textColor = .label
    }
    
    private func configureViewHierarchies() {
        let textLabel = self.textLabel
        
        self.addSubview(textLabel)
    }
    
    private func configureLayoutConstraints() {
        let textLabel = self.textLabel
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            self.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 20.0),
            self.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 12.0)
        ])
    }
}
