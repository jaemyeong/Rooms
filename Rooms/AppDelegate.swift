import UIKit

public final class AppDelegate: UIResponder {}

@main
extension AppDelegate: UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        AppConfigurer.configure()
        
        return true
    }
    
    public func applicationWillTerminate(_ application: UIApplication) {
        AppUnconfigurer.unconfigure()
    }
    
    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
