import Foundation

import Firebase

public struct FirebaseConfigurer {
    private let messagingDelegate: MessagingDelegate
    
    public init(messagingDelegate: MessagingDelegate) {
        self.messagingDelegate = messagingDelegate
    }
    
    public func configure() {
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self.messagingDelegate
    }
    
    public func callAsFunction() {
        self.configure()
    }
}
