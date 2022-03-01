import Foundation

import os

import Firebase

public final class MessagingDelegateAdaptor: NSObject {
    public static let shared: MessagingDelegateAdaptor = MessagingDelegateAdaptor()
}

extension MessagingDelegateAdaptor: MessagingDelegate {
    public func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        os_log(.info, "%@", String(describing: fcmToken))
    }
}
