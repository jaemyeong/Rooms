import UIKit

import os

import Pretendard

import Firebase

public final class AppDelegate: UIResponder {}

@main
extension AppDelegate: UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        do {
            try Pretendard.registerFonts()
        } catch {
            fatalError(String(describing: error))
        }
        
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self
        
        Task {
            let userNotificationCenter = UNUserNotificationCenter.current()
            userNotificationCenter.delegate = self
            
            do {
                try await userNotificationCenter.requestAuthorization(options: [.alert, .sound])
            } catch {
                os_log(.error, "%@", String(describing: error))
                
                return
            }
            
            application.registerForRemoteNotifications()
        }
        
        return true
    }
    
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
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

extension AppDelegate: UNUserNotificationCenterDelegate {
    
}

extension AppDelegate: MessagingDelegate {
    public func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        os_log(.info, "%@", String(describing: fcmToken))
    }
}
