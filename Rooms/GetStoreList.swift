import Foundation

import ErrorKit

public struct GetStoreList {
    private let groupCode: String
    
    public init(groupCode: String) {
        self.groupCode = groupCode
    }
    
    public func callAsFunction() async throws -> [Store] {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[Store], Error>) in
            if Task.isCancelled {
                continuation.resume(throwing: CancellationError())
                
                return
            }
            
            let action = Network.shared.apollo.fetch(query: GetGroupQuery(groupCode: self.groupCode)) { result in
                if Task.isCancelled {
                    continuation.resume(throwing: CancellationError())
                    
                    return
                }
                
                switch result {
                case .success(let value):
                    if let error = value.data?.group.error {
                        continuation.resume(throwing: UnknownError(message: error.message))
                        
                        return
                    }
                    
                    let items: [Store]
                    
                    do {
                        guard let unwrappedItems = try value.data?.group.response?.storeList?.map(Store.init(data:)) else {
                            continuation.resume(throwing: NilError())
                            
                            return
                        }
                        
                        items = unwrappedItems
                    } catch {
                        continuation.resume(throwing: error)
                        
                        return
                    }
                    
                    continuation.resume(returning: items)
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
