import UIKit

public final class SecurityViewController: UIViewController {
    private var contentView: SecurityView {
        self.view as! SecurityView
    }
    
    public override var prefersStatusBarHidden: Bool {
        true
    }
    
    public override func loadView() {
        self.view = SecurityView()
    }
}
