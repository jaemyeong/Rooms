import Foundation

import ErrorKit

public struct Store {
    public var name: String
    
    public var code: String
    
    public var timeZone: TimeZone
}

extension Store {
    public init(data: GetGroupQuery.Data.Group.Datum.List) throws {
        self.name = data.name
        self.code = data.code
        
        guard let timeZone = TimeZone(identifier: data.zoneinfo.tz) else {
            throw InstantiateError()
        }
        
        self.timeZone = timeZone
    }
}
