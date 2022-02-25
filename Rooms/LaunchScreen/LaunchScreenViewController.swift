import UIKit

import ErrorKit

public final class LaunchScreenViewController: UIViewController {
    private let viewModel: LaunchScreenViewModel
    
    private var contentView: LaunchScreenView {
        self.view as! LaunchScreenView
    }
    
    public override var prefersStatusBarHidden: Bool {
        true
    }
    
    public init(viewModel: LaunchScreenViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        self.configureViewModel()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    public override func loadView() {
        self.view = LaunchScreenView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewModel.onAppear()
    }
}

extension LaunchScreenViewController {
    private func configureViewModel() {
        self.viewModel.delegate = self
    }
}

extension LaunchScreenViewController: LaunchScreenViewModelDelegate {}
