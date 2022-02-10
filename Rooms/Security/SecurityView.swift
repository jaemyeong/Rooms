import UIKit

import ErrorKit

public final class SecurityView: UIView {
    private let imageView: UIImageView
    
    public override init(frame: CGRect) {
        self.imageView = UIImageView()
        
        super.init(frame: frame)
        
        self.configure()
        self.confiugreImageView()
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}

extension SecurityView {
    private func configure() {
        self.backgroundColor = .systemBackground
    }
    
    private func confiugreImageView() {
        let imageView = self.imageView
        imageView.tintColor = .label
        imageView.image = UIImage(systemName: "lock.shield")
        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 100.0, weight: .thin)
    }
    
    private func configureViewHierarchies() {
        self.addSubview(self.imageView)
    }
    
    private func configureLayoutConstraints() {
        let imageView = self.imageView
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
