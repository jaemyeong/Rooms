import UIKit

import ErrorKit

public final class SceneDelegate: UIResponder {
    public var window: UIWindow?
    
    public weak var delegateAdaptor: SceneDelegateAdaptor?
}

extension SceneDelegate: UIWindowSceneDelegate {
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let (window, delegateAdaptor) = AppCoordinator.shared.connectScene(scene: scene)
        
        self.window = window
        
        self.delegateAdaptor = delegateAdaptor
        
        window.makeKeyAndVisible()
    }
    
    public func sceneDidDisconnect(_ scene: UIScene) {
        AppCoordinator.shared.disconnectScene(scene: scene)
    }
    
    public func sceneDidBecomeActive(_ scene: UIScene) {
        self.delegateAdaptor?.sceneDidBecomeActive(scene)
    }
    
    public func sceneWillResignActive(_ scene: UIScene) {
        self.delegateAdaptor?.sceneWillResignActive(scene)
    }
    
    public func sceneWillEnterForeground(_ scene: UIScene) {
        self.delegateAdaptor?.sceneWillEnterForeground(scene)
    }
    
    public func sceneDidEnterBackground(_ scene: UIScene) {
        self.delegateAdaptor?.sceneDidEnterBackground(scene)
    }
}
