import XCTest

public final class RoomsUITestsLaunchTests: XCTestCase {
    public override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    public override func setUpWithError() throws {
        try super.setUpWithError()
        
        self.continueAfterFailure = false
    }

    public func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        
        self.add(attachment)
    }
}
