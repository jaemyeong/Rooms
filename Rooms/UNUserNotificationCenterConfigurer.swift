import UIKit

public enum UNUserNotificationCenterConfigurer {
    public static func configure() {
        UNUserNotificationCenter.current().delegate = UserNotificationCenterDelegateAdaptor.shared
    }
}
