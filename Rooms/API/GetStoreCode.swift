import Foundation

import ErrorKit

public struct GetStoreCode {
    private let groupCode: String
    
    public init(groupCode: String) {
        self.groupCode = groupCode
    }
    
    public func execute() async throws -> String {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<String, Error>) in
            let action = Network.shared.apollo.fetch(query: GetGroupQuery(groupCode: self.groupCode)) { result in
                if Task.isCancelled {
                    continuation.resume(throwing: CancellationError())
                    
                    return
                }
                
                switch result {
                case .success(let value):
                    guard value.data?.group.error == nil else {
                        continuation.resume(throwing: UnknownError())
                        
                        return
                    }
                    
                    guard let code = value.data?.group.data?.list?.first?.code else {
                        continuation.resume(throwing: NilError())
                        
                        return
                    }
                    continuation.resume(returning: code)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
            
            if Task.isCancelled {
                action.cancel()
                
                continuation.resume(throwing: CancellationError())
            }
        }
    }
}
