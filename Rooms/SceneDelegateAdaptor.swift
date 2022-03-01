import UIKit

public protocol SceneDelegateAdaptor: AnyObject {
    func sceneDidBecomeActive(_ scene: UIScene)
    
    func sceneWillResignActive(_ scene: UIScene)
    
    func sceneWillEnterForeground(_ scene: UIScene)
    
    func sceneDidEnterBackground(_ scene: UIScene)
}
