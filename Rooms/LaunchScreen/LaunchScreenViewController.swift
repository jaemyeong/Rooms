import UIKit

import os

import Pretendard

import RunOnce

public final class LaunchScreenViewController: UIViewController {
    private let launchOnceToken: RunOnceToken
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.launchOnceToken = RunOnceToken()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    private var contentView: LaunchScreenView {
        self.view as! LaunchScreenView
    }
    
    public override var prefersStatusBarHidden: Bool {
        true
    }
    
    public override func loadView() {
        self.view = LaunchScreenView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.launchOnceToken {
            await self.contentView.launch()
            
            do {
                try await Task.sleep(nanoseconds: 2_500_000_000)
            } catch {
                os_log(.error, "%@", String(describing: error))
                
                return
            }
            
            await self.presentMain()
        }
    }
}

extension LaunchScreenViewController {
    private func presentMain() {
        guard let window = self.view.window else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: MainViewController())
        
        UINavigationBarConfigurer(navigationBar: navigationController.navigationBar).configure()
        
        window.rootViewController = navigationController
    }
}
