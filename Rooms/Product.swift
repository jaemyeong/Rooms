import Foundation

public struct Product {
    public var identifier: String
    
    public var name: String
    
    public var subtitle: String
    
    public var code: String
    
    public var images: [URL]
}

extension Product: Hashable {}

extension Product {
    public init(data: GetGroupQuery.Data.Group.Response.Store.Product) {
        self.identifier = data.identifier
        
        self.name = data.name
        
        self.subtitle = data.subtitle ?? ""
        
        self.code = data.code
        
        self.images = data.images?.compactMap(URL.init(string:)) ?? []
    }
}
