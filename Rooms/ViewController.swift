import UIKit

import os

public final class ViewController: UIViewController {
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Task.detached {
            let storeCode: String
            
            do {
                storeCode = try await GetStoreCode(groupCode: "FVFWKW").execute()
            } catch {
                os_log(.error, "%@", String(describing: error))
                
                return
            }
            
            os_log(.info, "%@", storeCode)
            
            let timeZone: TimeZone
            
            do {
                timeZone = try await GetTimeZone().execute()
            } catch {
                os_log(.error, "%@", String(describing: error))
                
                return
            }
            
            os_log(.info, "%@", String(describing: timeZone))
        }
    }
}
