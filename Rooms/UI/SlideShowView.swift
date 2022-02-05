import UIKit

import OpenColorKit

public final class SlideShowView: UIView {
    private let activityIndicatorView: UIActivityIndicatorView
    
    private let pageControl: UIPageControl
    
    public override init(frame: CGRect) {
        self.pageControl = UIPageControl()
        self.activityIndicatorView = UIActivityIndicatorView()
        
        super.init(frame: frame)
        
        self.configure()
        self.configureActivityIndicatorView()
        self.configurePageControl()
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}

extension SlideShowView {
    private func configure() {
        self.backgroundColor = .systemBackground
    }
    
    private func configureActivityIndicatorView() {
        let activityIndicatorView = self.activityIndicatorView
        activityIndicatorView.startAnimating()
    }
    
    private func configurePageControl() {
        let pageControl = self.pageControl
        pageControl.hidesForSinglePage = false
        pageControl.numberOfPages = 3
    }
    
    private func configureViewHierarchies() {
        self.addSubview(self.activityIndicatorView)
        self.addSubview(self.pageControl)
    }
    
    private func configureLayoutConstraints() {
        let activityIndicatorView = self.activityIndicatorView
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        let pageControl = self.pageControl
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor)
        ])
    }
}
