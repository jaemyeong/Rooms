import Foundation

import os

import Pretendard

public struct PretendardConfigurer {
    public func configure() {
        do {
            try Pretendard.registerFonts()
        } catch {
            os_log(.error, "%@", String(describing: error))
        }
    }
    
    public func callAsFunction() {
        self.configure()
    }
}
