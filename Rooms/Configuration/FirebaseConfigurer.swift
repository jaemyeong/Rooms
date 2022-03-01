import Foundation

import Firebase

public enum FirebaseConfigurer {
    public static func configure() {
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = MessagingDelegateAdaptor.shared
    }
}
