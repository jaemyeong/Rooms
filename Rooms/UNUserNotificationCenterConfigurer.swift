import UIKit

import os

import RunOnce

public struct UNUserNotificationCenterConfigurer {
    private let delegate: UNUserNotificationCenterDelegate
    
    public init(delegate: UNUserNotificationCenterDelegate) {
        self.delegate = delegate
    }
    
    public func configure() {
        UNUserNotificationCenter.current().delegate = self.delegate
    }
    
    public func callAsFunction() {
        self.configure()
    }
}
