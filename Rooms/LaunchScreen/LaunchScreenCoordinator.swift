import UIKit

public final class LaunchScreenCoordinator {
    private let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func presentMain() {
        let navigationController = UINavigationController(rootViewController: MainViewController())
        
        UINavigationBarConfigurer(navigationBar: navigationController.navigationBar).configure()
        
        self.window.rootViewController = navigationController
    }
}
