import UIKit

import os

import Pretendard

public final class ProductCollectionViewCell: UICollectionViewCell {
    public let textLabel: UILabel
    
    public let subtitleLabel: UILabel
    
    public let slideShowView: SlideShowView
    
    private let textLabelBackgroundView: UIView
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel()
        self.textLabelBackgroundView = UIView()
        self.subtitleLabel = UILabel()
        self.slideShowView = SlideShowView()
        
        super.init(frame: frame)
        
        self.configure()
        self.configureTextLabel()
        self.configureTextLabelBackgroundView()
        self.configureSubtitleLabel()
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        self.textLabel.text = nil
        self.subtitleLabel.text = nil
    }
}

extension ProductCollectionViewCell {
    private func configure() {
        self.backgroundColor = .systemBackground
    }
    
    private func configureTextLabel() {
        let textLabel = self.textLabel
        
        do {
            textLabel.font = try .pretendardFont(ofSize: 16.0, weight: .semibold)
        } catch {
            os_log(.error, "%@", String(describing: error))
            
            textLabel.font = .systemFont(ofSize: 16.0, weight: .semibold)
        }
        
        textLabel.textColor = .label
    }
    
    private func configureTextLabelBackgroundView() {
        let textLabelBackgroundView = self.textLabelBackgroundView
        textLabelBackgroundView.backgroundColor = .secondarySystemBackground
    }
    
    private func configureSubtitleLabel() {
        let subtitleLabel = self.subtitleLabel
        
        do {
            subtitleLabel.font = try .pretendardFont(ofSize: 14.0, weight: .thin)
        } catch {
            os_log(.error, "%@", String(describing: error))
            
            subtitleLabel.font = .systemFont(ofSize: 14.0, weight: .thin)
        }
        
        subtitleLabel.textColor = .secondaryLabel
    }
    
    private func configureViewHierarchies() {
        self.addSubview(self.textLabel)
        self.insertSubview(self.textLabelBackgroundView, belowSubview: self.textLabel)
        self.addSubview(self.subtitleLabel)
        self.insertSubview(self.slideShowView, belowSubview: self.subtitleLabel)
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
        
        let subtitleLabel = self.subtitleLabel
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            subtitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2.0),
            self.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor, constant: 2.0)
        ])
        
        let slideShowView = self.slideShowView
        
        slideShowView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            slideShowView.topAnchor.constraint(equalTo: self.topAnchor),
            slideShowView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: slideShowView.trailingAnchor),
            textLabelBackgroundView.topAnchor.constraint(equalTo: slideShowView.bottomAnchor)
        ])
    }
}
