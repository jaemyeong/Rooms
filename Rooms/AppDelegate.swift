import UIKit

public final class AppDelegate: UIResponder {}

@main
extension AppDelegate: UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        AppCoordinator.shared.launch()
    }
    
    public func applicationWillTerminate(_ application: UIApplication) {
        AppCoordinator.shared.terminate()
    }
    
    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        AppCoordinator.shared.connectingSceneSession(sceneSession: connectingSceneSession)
    }
    
    public func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        AppCoordinator.shared.discardSceneSessions(sceneSessions: sceneSessions)
    }
}
