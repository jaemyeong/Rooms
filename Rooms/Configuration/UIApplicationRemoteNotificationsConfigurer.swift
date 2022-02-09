import UIKit

public enum UIApplicationRemoteNotificationsConfigurer {
    public static func configure() {
        UIApplication.shared.registerForRemoteNotifications()
    }
}
