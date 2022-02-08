import UIKit

import ErrorKit

public final class AppDelegate: UIResponder {
    private weak var delegate: AppDelegateAdaptor? = AppCoordinator.shared
}

@main
extension AppDelegate: UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        guard let delegate = self.delegate else {
            fatalError(String(describing: NilError()))
        }
        
        return delegate.launch()
    }
    
    public func applicationWillTerminate(_ application: UIApplication) {
        guard let delegate = self.delegate else {
            fatalError(String(describing: NilError()))
        }
        
        delegate.terminate()
    }
    
    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        guard let delegate = self.delegate else {
            fatalError(String(describing: NilError()))
        }
        
        return delegate.connectScene(sceneSession: connectingSceneSession)
    }
}
