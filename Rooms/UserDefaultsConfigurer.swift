import Foundation

public enum UserDefaultsConfigurer {
    public static func configure() {
        UserDefaults.standard.register(defaults: [
            "GroupCode": "FVFWKW"
        ])
    }}
