import Foundation

import os

import Pretendard

public enum PretendardUnconfigurer {
    public static func unconfigure() {
        do {
            try Pretendard.unregisterFonts()
        } catch {
            os_log(.error, "%@", String(describing: error))
        }
    }
}
