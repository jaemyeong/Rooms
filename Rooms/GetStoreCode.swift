import Foundation

import ErrorKit

public struct GetStoreCode {
    private let groupCode: String
    
    public init(groupCode: String) {
        self.groupCode = groupCode
    }
    
    public func execute() async throws -> String {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<String, Error>) in
            Network.shared.apollo.fetch(query: GetStoreListQuery(groupCode: self.groupCode)) { result in
                do {
                    try Task.checkCancellation()
                } catch {
                    continuation.resume(throwing: error)
                }
                
                switch result {
                case .success(let value):
                    guard let code = value.data?.group.data?.list?.first?.code else {
                        continuation.resume(throwing: NilError())
                        return
                    }
                    continuation.resume(returning: code)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
