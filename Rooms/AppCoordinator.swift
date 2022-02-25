import UIKit

import os

import ErrorKit

public final class AppCoordinator {
    public static let shared: AppCoordinator = AppCoordinator()
    
    private var children: [AnyHashable: Any] = [:]
    
    public func connectScene(scene: UIScene) -> (UIWindow, SceneDelegateAdaptor) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError(String(describing: TypeCastingError()))
        }
        
        let window = UIWindow(windowScene: windowScene)
        
        let coordinator = LaunchScreenCoordinator(window: window)
        
        let viewModel = LaunchScreenViewModel(coordinator: coordinator)
        
        let viewController = LaunchScreenViewController(viewModel: viewModel)
        
        window.rootViewController = viewController
        
        let delegateAdaptor = SceneCoordinator(window: window)
        delegateAdaptor.delegate = self
        
        self.children[ObjectIdentifier(scene)] = delegateAdaptor
        
        return (window, delegateAdaptor)
    }
    
    public func disconnectScene(scene: UIScene) {
        self.children[ObjectIdentifier(scene)] = nil
    }
}

extension AppCoordinator: SceneCoordinatorDelegate {}
