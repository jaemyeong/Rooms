import UIKit

import os

import Pretendard

public final class ProductCollectionViewCell: UICollectionViewCell {
    public let textLabel: UILabel
    
    public let subtitleLabel: UILabel
    
    private let textLabelBackgroundView: UIView
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel()
        self.textLabelBackgroundView = UIView()
        self.subtitleLabel = UILabel()
        
        super.init(frame: frame)
        
        self.configure()
        self.configureTextLabel()
        self.configureTextLabelBackgroundView()
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ProductCollectionViewCell {
    private func configure() {
        self.backgroundColor = .systemBackground
    }
    
    private func configureTextLabel() {
        let textLabel = self.textLabel
        
        do {
            textLabel.font = try .pretendardFont(ofSize: 14.0, weight: .regular)
        } catch {
            os_log(.error, "%@", String(describing: error))
            
            textLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        }
        
        textLabel.textColor = .label
    }
    
    private func configureTextLabelBackgroundView() {
        let textLabelBackgroundView = self.textLabelBackgroundView
        textLabelBackgroundView.backgroundColor = .secondarySystemBackground
    }
    
    private func configureViewHierarchies() {
        self.addSubview(self.textLabelBackgroundView)
        self.addSubview(self.textLabel)
    }
    
    private func configureLayoutConstraints() {
        let textLabel = self.textLabel
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            self.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 20.0),
            self.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 12.0)
        ])
        
        let textLabelBackgroundView = self.textLabelBackgroundView
        
        textLabelBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            textLabel.topAnchor.constraint(equalTo: textLabelBackgroundView.topAnchor, constant: 12.0),
            textLabelBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2.0),
            self.trailingAnchor.constraint(equalTo: textLabelBackgroundView.trailingAnchor, constant: 2.0),
            self.bottomAnchor.constraint(equalTo: textLabelBackgroundView.bottomAnchor)
        ])
    }
}
