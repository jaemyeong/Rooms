import XCTest

public final class RoomsUITests: XCTestCase {
    public override func setUpWithError() throws {
        try super.setUpWithError()
        
        self.continueAfterFailure = false
    }

    public func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    public func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            self.measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
