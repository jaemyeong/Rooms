import UIKit

import ErrorKit

public final class SceneDelegate: UIResponder {
    private var internalWindow: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {
    public var window: UIWindow? {
        get {
            self.internalWindow
        }
        set {
            self.internalWindow = newValue
        }
    }
    
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError(String(describing: TypeCastingError()))
        }
        
        let navigationController = UINavigationController(rootViewController: MainViewController())
        navigationController.navigationBar.prefersLargeTitles = true
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        
        defer {
            window.makeKeyAndVisible()
        }
        
        self.window = window
    }
}
