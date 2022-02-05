import UIKit

public struct UIApplicationRemoteNotificationsConfigurer {
    public func configure(application: UIApplication) {
        application.registerForRemoteNotifications()
    }
    
    public func callAsFunction(application: UIApplication) {
        self.configure(application: application)
    }
}
