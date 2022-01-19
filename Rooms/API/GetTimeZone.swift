import Foundation

import ErrorKit

public struct GetTimeZone {
    public func execute() async throws -> TimeZone {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<TimeZone, Error>) in
            guard let timeZone = TimeZone(identifier: "Asia/Seoul") else {
                continuation.resume(throwing: NilError())
                
                return
            }
            
            continuation.resume(returning: timeZone)
        }
    }
}
