import Foundation

public enum AppUnconfigurer: Unconfigurer {
    public static func unconfigure() {
        PretendardUnconfigurer.unconfigure()
    }
}
