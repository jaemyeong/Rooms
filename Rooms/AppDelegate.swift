import UIKit

import os

import Firebase

import Pretendard

import RunOnce

public final class AppDelegate: UIResponder {
    private var pretendardOnceToken: RunOnceToken
    
    public override init() {
        self.pretendardOnceToken = RunOnceToken()
        
        super.init()
    }
}

@main
extension AppDelegate: UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        self.pretendardOnceToken {
            do {
                try Pretendard.registerFonts()
            } catch {
                fatalError(String(describing: error))
            }
        }
        
        self.pretendardOnceToken {
            do {
                try Pretendard.registerFonts()
            } catch {
                fatalError(String(describing: error))
            }
        }
        
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self
        
        Task.detached {
            let userNotificationCenter = UNUserNotificationCenter.current()
            userNotificationCenter.delegate = self
            
            do {
                try await userNotificationCenter.requestAuthorization(options: [.alert, .sound])
            } catch {
                os_log(.error, "%@", String(describing: error))
                
                return
            }
        }
        
        application.registerForRemoteNotifications()
        
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
