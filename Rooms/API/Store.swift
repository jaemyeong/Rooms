import Foundation

import ErrorKit

public struct Store {
    public var identifier: String
    
    public var name: String
    
    public var code: String
    
    public var timeZone: TimeZone
}

extension Store: Hashable {}

extension Store {
    public init(data: GetGroupQuery.Data.Group.Datum.List) throws {
        self.identifier = data._id
        
        self.name = data.name
        
        self.code = data.code
        
        guard let timeZone = TimeZone(identifier: data.zoneinfo.tz) else {
            throw InstantiateError(message: NSLocalizedString("TimeZone", comment: ""))
        }
        
        self.timeZone = timeZone
    }
}
