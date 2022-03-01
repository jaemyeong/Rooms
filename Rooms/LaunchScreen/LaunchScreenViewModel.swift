import Foundation

public final class LaunchScreenViewModel {
    public weak var delegate: LaunchScreenViewModelDelegate?
    
    private let coordinator: LaunchScreenCoordinator
    
    public init(coordinator: LaunchScreenCoordinator) {
        self.coordinator = coordinator
    }
    
    func onAppear() {}
}
