import UIKit

public final class EmptyViewController: UIViewController {
    private var contentView: EmptyView {
        self.view as! EmptyView
    }
    
    public override var prefersStatusBarHidden: Bool {
        true
    }
    
    public override func loadView() {
        self.view = EmptyView()
    }
}
