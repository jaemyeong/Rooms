import Foundation

public struct UserDefaultsConfigurer {
    public func configure() {
        UserDefaults.standard.register(defaults: [
            "GroupCode": "FVFWKW"
        ])
    }
    
    public func callAsFunction() {
        self.configure()
    }
}
