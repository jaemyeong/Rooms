import Foundation

import os

import Pretendard

public enum PretendardConfigurer {
    public static func configure() {
        do {
            try Pretendard.registerFonts()
        } catch {
            os_log(.error, "%@", String(describing: error))
        }
    }
}
