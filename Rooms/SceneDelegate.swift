import UIKit

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
}
