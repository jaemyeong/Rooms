import UIKit

import os

import ErrorKit

public final class AppCoordinator {
    public static let shared: AppCoordinator = AppCoordinator()
    
    private var children: [AnyHashable: Any] = [:]
    
    public func launch() -> Bool {
        AppConfigurer.configure()
        
        os_log(.debug, "%@", String(describing: UserDefaults.standard.dictionaryRepresentation()))
        
        return true
    }
    
    public func terminate() {
        AppUnconfigurer.unconfigure()
    }
    
    public func connectingSceneSession(sceneSession: UISceneSession) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: sceneSession.role)
    }
    
    public func discardSceneSessions(sceneSessions: Set<UISceneSession>) {}
    
    public func connectScene(scene: UIScene) -> (UIWindow, SceneDelegateAdaptor) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError(String(describing: TypeCastingError()))
        }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = LaunchScreenViewController()
        
        let coordinator = SceneCoordinator(window: window)
        coordinator.delegate = self
        
        self.children[ObjectIdentifier(scene)] = coordinator
        
        return (window, coordinator)
    }
    
    public func disconnectScene(scene: UIScene) {
        self.children[ObjectIdentifier(scene)] = nil
    }
}

extension AppCoordinator: SceneCoordinatorDelegate {}
