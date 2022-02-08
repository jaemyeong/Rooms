import UIKit

import ErrorKit

public protocol SceneCoordinatorDelegate {
    func willConnnect(_ coordinator: SceneCoordinator)
}

public final class SceneCoordinator {
    public let window: UIWindow
    
    public init(scene: UIScene) throws {
        guard let windowScene = scene as? UIWindowScene else {
            throw TypeCastingError()
        }
        
        self.window = UIWindow(windowScene: windowScene)
    }
    
    public func connect() {
        let window = self.window
        window.rootViewController = LaunchScreenViewController()
        window.makeKeyAndVisible()
    }
}
