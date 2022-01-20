import UIKit

import os

public final class ViewController: UIViewController {
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Task.detached {
            let action = GetStoreList(groupCode: "FVFWKW")
            
            let storeList: [Store]
            
            do {
                storeList = try await action()
            } catch {
                os_log(.error, "%@", String(describing: error))
                
                return
            }
            
            os_log(.info, "%@", String(describing: storeList))
        }
    }
}
