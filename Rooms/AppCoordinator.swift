import UIKit

import os

public final class AppCoordinator {
    public static let shared: AppCoordinator = AppCoordinator()
}

extension AppCoordinator: AppDelegateAdaptor {
    public func launch() -> Bool {
        AppConfigurer.configure()
        
        os_log(.debug, "%@", String(describing: UserDefaults.standard.dictionaryRepresentation()))
        
        return true
    }
    
    public func terminate() {
        AppUnconfigurer.unconfigure()
    }
    
    public func connectScene(sceneSession: UISceneSession) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: sceneSession.role)
    }
}
