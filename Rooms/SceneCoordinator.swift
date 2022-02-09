import UIKit

public final class SceneCoordinator {
    private let window: UIWindow
    
    private var children: [AnyHashable: Any] = [:]
    
    public weak var delegate: SceneCoordinatorDelegate?
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    private func presentLaunchScreen(restorationIdentifier: AnyHashable) {
        self.window.rootViewController = self.children.removeValue(forKey: restorationIdentifier) as? UIViewController ?? LaunchScreenViewController()
    }
    
    private func presentEmpty(restorationIdentifier: AnyHashable) {
        self.children.updateValue(self.window.rootViewController as Any, forKey: restorationIdentifier)
        
        self.window.rootViewController = EmptyViewController()
    }
}

extension SceneCoordinator: SceneDelegateAdaptor {
    public func sceneDidBecomeActive(_ scene: UIScene) {
        self.presentLaunchScreen(restorationIdentifier: scene.session.persistentIdentifier)
    }
    
    public func sceneWillResignActive(_ scene: UIScene) {
        self.presentEmpty(restorationIdentifier: scene.session.persistentIdentifier)
    }
    
    public func sceneWillEnterForeground(_ scene: UIScene) {}
    
    public func sceneDidEnterBackground(_ scene: UIScene) {}
}
