import UIKit

import Pretendard

public final class AppDelegate: UIResponder {}

@main
extension AppDelegate: UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        do {
            try Pretendard.registerFonts()
        } catch {
            fatalError(String(describing: error))
        }
        
        return true
    }
    
    public func applicationWillTerminate(_ application: UIApplication) {
        do {
            try Pretendard.unregisterFonts()
        } catch {
            fatalError(String(describing: error))
        }
    }
    
    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
