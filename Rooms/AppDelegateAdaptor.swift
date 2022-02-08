import UIKit

public protocol AppDelegateAdaptor: AnyObject {
    func launch() -> Bool
    
    func terminate()
    
    func connectScene(sceneSession: UISceneSession) -> UISceneConfiguration
}
