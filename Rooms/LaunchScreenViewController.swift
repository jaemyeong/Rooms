import UIKit

import os

import Pretendard

public final class LaunchScreenViewController: UIViewController {
    private var contentView: LaunchScreenView {
        self.view as! LaunchScreenView
    }
    
    public override func loadView() {
        self.view = LaunchScreenView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UINavigationBarAppearanceConfigurer.configure()
        
        Task.detached {
            await self.contentView.launch()
            
            do {
                try await Task.sleep(nanoseconds: 5_000_000_000)
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
        navigationController.navigationBar.prefersLargeTitles = true
        
        window.rootViewController = navigationController
    }
}
