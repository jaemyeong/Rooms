import Foundation

public enum AppConfigurer: Configurer {
    public static func configure() {
        PretendardConfigurer.configure()

        FirebaseConfigurer.configure()
        
        UNUserNotificationCenterConfigurer.configure()

        UserDefaultsConfigurer.configure()

        UIApplicationRemoteNotificationsConfigurer.configure()
    }
}
