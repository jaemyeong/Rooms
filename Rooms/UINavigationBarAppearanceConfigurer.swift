import UIKit

import os

import Pretendard

public enum UINavigationBarAppearanceConfigurer {
    public static func configure() {
        let appearance = UINavigationBar.appearance()
        
        self.configureTitleTextAttributes(appearance)
        
        self.configureLargeTitleTextAttributes(appearance)
    }
    
    private static func configureTitleTextAttributes(_ appearance: UINavigationBar) {
        let font: UIFont
        
        do {
            font = try .pretendardFont(ofSize: 17.0, weight: .semibold) ?? .systemFont(ofSize: 17.0, weight: .semibold)
        } catch {
            os_log(.error, "%@", String(describing: error))
            
            font = .systemFont(ofSize: 17.0, weight: .semibold)
        }
        
        appearance.titleTextAttributes = [
            .font: font
        ]
    }
    
    private static func configureLargeTitleTextAttributes(_ appearance: UINavigationBar) {
        let font: UIFont
        
        do {
            font = try .pretendardFont(ofSize: 34.0, weight: .bold) ?? .systemFont(ofSize: 34.0, weight: .bold)
        } catch {
            os_log(.error, "%@", String(describing: error))
            
            font = .systemFont(ofSize: 34.0, weight: .bold)
        }
        
        appearance.titleTextAttributes = [
            .font: font
        ]
    }
}
