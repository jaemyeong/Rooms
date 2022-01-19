import UIKit

import os

public final class SceneDelegate: UIResponder {
    private var internalWindow: UIWindow?
    
    private var getStoreCodeTask: Task<Void, Error>? {
        willSet {
            guard let getStoreCodeTask = self.getStoreCodeTask else {
                return
            }
            getStoreCodeTask.cancel()
        }
    }
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
        self.getStoreCodeTask = Task.detached {
            let storeCode = try await GetStoreCode(groupCode: "FVFWKW").execute()
            
            os_log(.info, "storeCode: %@", storeCode)
        }
    }
}
