import UIKit

public struct UIApplicationRemoteNotificationsConfigurer {
    public func configure() {
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    public func callAsFunction() {
        self.configure()
    }
}
