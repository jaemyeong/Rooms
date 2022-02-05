import UIKit

import OpenColorKit

public final class SlideShowView: UIView {
    private let scrollView: UIScrollView
    
    private let activityIndicatorView: UIActivityIndicatorView
    
    private let pageControl: UIPageControl
    
    public var images: [UIImage]? {
        didSet {
            guard let images = self.images else {
                self.scrollView.isHidden = true
                
                self.activityIndicatorView.startAnimating()
                
                return
            }
            
            self.scrollView.isHidden = false
            
            self.activityIndicatorView.stopAnimating()
            
            self.pageControl.numberOfPages = images.count
            
            var index = 0
            
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
                guard let self = self else {
                    return
                }
                
                self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
                
                index += 1
            }
        }
    }
    
    private var timer: Timer? {
        willSet {
            guard let timer = self.timer else {
                return
            }
            timer.invalidate()
        }
    }
    
    public override init(frame: CGRect) {
        self.scrollView = UIScrollView()
        self.activityIndicatorView = UIActivityIndicatorView()
        self.pageControl = UIPageControl()
        
        super.init(frame: frame)
        
        self.configure()
        self.configureScrollView()
        self.configureActivityIndicatorView()
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
    
    private func configureScrollView() {
        let scrollView = self.scrollView
        scrollView.isHidden = true
        scrollView.isUserInteractionEnabled = false
    }
    
    private func configureActivityIndicatorView() {
        let activityIndicatorView = self.activityIndicatorView
        activityIndicatorView.startAnimating()
    }
    
    private func configureViewHierarchies() {
        self.addSubview(self.scrollView)
        self.addSubview(self.activityIndicatorView)
        self.addSubview(self.pageControl)
    }
    
    private func configureLayoutConstraints() {
        let scrollView = self.scrollView
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        let activityIndicatorView = self.activityIndicatorView
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        let pageControl = self.pageControl
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            pageControl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: pageControl.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor)
        ])
    }
}
