import UIKit

import os

import Firebase

public final class AppDelegate: UIResponder {
    private lazy var pretendardConfigure: PretendardConfigurer = PretendardConfigurer()
    
    private lazy var pretendardUnconfigure: PretendardUnconfigurer = PretendardUnconfigurer()
    
    private lazy var firebaseConfigure: FirebaseConfigurer = FirebaseConfigurer(messagingDelegate: self)
    
    private lazy var userNotificationCenterConfigure: UNUserNotificationCenterConfigurer = UNUserNotificationCenterConfigurer(delegate: self)
    
    private lazy var applicationRemoteNotificationsConfigure: UIApplicationRemoteNotificationsConfigurer = UIApplicationRemoteNotificationsConfigurer()
    
    private lazy var userDefaultsConfigure: UserDefaultsConfigurer = UserDefaultsConfigurer()
}

@main
extension AppDelegate: UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        self.pretendardConfigure()
        
        self.firebaseConfigure()
        
        self.userNotificationCenterConfigure()
        
        self.userDefaultsConfigure()
        
        self.applicationRemoteNotificationsConfigure()
        
        os_log(.debug, "%@", String(describing: UserDefaults.standard.dictionaryRepresentation()))
        
        return true
    }
    
    public func applicationWillTerminate(_ application: UIApplication) {
        self.pretendardUnconfigure()
    }
    
    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}

extension AppDelegate: MessagingDelegate {
    public func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        os_log(.info, "%@", String(describing: fcmToken))
    }
}
