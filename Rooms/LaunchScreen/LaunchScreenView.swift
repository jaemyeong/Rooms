import UIKit

import OpenColorKit

import ErrorKit

public final class LaunchScreenView: UIView {
    private let activityIndicatorView: UIActivityIndicatorView
    
    public override init(frame: CGRect) {
        self.activityIndicatorView = UIActivityIndicatorView()
        
        super.init(frame: frame)
        
        self.configure()
        self.confiugreActivityIndicatorView()
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    public func launch() {
        self.activityIndicatorView.startAnimating()
    }
}

extension LaunchScreenView {
    private func configure() {
        self.backgroundColor = .openColor.blue.blue6.color
    }
    
    private func confiugreActivityIndicatorView() {
        let activityIndicatorView = self.activityIndicatorView
        activityIndicatorView.hidesWhenStopped = false
    }
    
    private func configureViewHierarchies() {
        self.addSubview(self.activityIndicatorView)
    }
    
    private func configureLayoutConstraints() {
        let activityIndicatorView = self.activityIndicatorView
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
