import UIKit

import ErrorKit

public struct Store {
    public var identifier: String
    
    public var name: String
    
    public var code: String
    
    public var timeZone: TimeZone
    
    public var products: [Product]
}

extension Store: Hashable {}

extension Store {
    public init(data: GetGroupQuery.Data.Group.Response.Store) throws {
        guard let timeZone = TimeZone(identifier: data.region.timeZone) else {
            throw InstantiateError(message: NSLocalizedString("TimeZone", comment: ""))
        }
        
        self.identifier = data.identifier
        
        self.name = data.name
        
        self.code = data.code
        
        self.timeZone = timeZone
        
        self.products = data.products?.map(Product.init(data:)) ?? []
    }
}

extension Store {
    public func configureCell(_ cell: UICollectionViewCell) {}
}
