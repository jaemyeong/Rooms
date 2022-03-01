import Foundation

import os

public enum UserDefaultsConfigurer {
    public static func configure() {
        UserDefaults.standard.register(defaults: [
            "GroupCode": "FVFWKW"
        ])
        
        os_log(.debug, "%@", String(describing: UserDefaults.standard.dictionaryRepresentation()))
    }
}
