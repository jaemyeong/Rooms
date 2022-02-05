import Foundation

import os

import Pretendard

public struct PretendardUnconfigurer {
    public func unconfigure() {
        do {
            try Pretendard.unregisterFonts()
        } catch {
            os_log(.error, "%@", String(describing: error))
        }
    }
    
    public func callAsFunction() {
        self.unconfigure()
    }
}
