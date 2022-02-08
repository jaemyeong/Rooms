import UIKit

import ErrorKit

public final class SceneDelegate: UIResponder {
    public var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let coordinator: SceneCoordinator
        
        do {
            coordinator = try SceneCoordinator(scene: scene)
        } catch {
            fatalError(String(describing: error))
        }
        
        defer {
            coordinator.connect()
        }
        
        self.window = coordinator.window
    }
}
