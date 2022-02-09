import UIKit

import os

import Pretendard

public struct UINavigationBarConfigurer {
    private let navigationBar: UINavigationBar
    
    public init(navigationBar: UINavigationBar) {
        self.navigationBar = navigationBar
    }
    
    public func configure() {
        let navigationBar = self.navigationBar
        navigationBar.prefersLargeTitles = true
        navigationBar.standardAppearance = UINavigationBarAppearance()
            .configureTitleTextAttributes()
            .configureLargeTitleTextAttributes()
    }
}

extension UINavigationBarAppearance {
    fileprivate func configureTitleTextAttributes() -> UINavigationBarAppearance {
        let font: UIFont
        
        do {
            font = try .pretendardFont(ofSize: 17.0, weight: .semibold) ?? .systemFont(ofSize: 17.0, weight: .semibold)
        } catch {
            os_log(.error, "%@", String(describing: error))
            
            font = .systemFont(ofSize: 17.0, weight: .semibold)
        }
        
        self.titleTextAttributes = [
            .font: font
        ]
        
        return self
    }
    
    fileprivate func configureLargeTitleTextAttributes() -> UINavigationBarAppearance {
        let font: UIFont
        
        do {
            font = try .pretendardFont(ofSize: 34.0, weight: .bold) ?? .systemFont(ofSize: 34.0, weight: .bold)
        } catch {
            os_log(.error, "%@", String(describing: error))
            
            font = .systemFont(ofSize: 34.0, weight: .bold)
        }
        
        self.largeTitleTextAttributes = [
            .font: font
        ]
        
        return self
    }
}
