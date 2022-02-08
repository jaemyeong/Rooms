import UIKit

public final class UserNotificationCenterDelegateAdaptor: NSObject {
    public static let shared: UserNotificationCenterDelegateAdaptor = UserNotificationCenterDelegateAdaptor()
}

extension UserNotificationCenterDelegateAdaptor: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}
