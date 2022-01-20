import UIKit

import ErrorKit

public final class StoreTableViewCell: UITableViewCell {}

extension Store {
    public func configureCell(_ cell: UITableViewCell) {
        guard let cell = cell as? StoreTableViewCell else {
            fatalError(String(describing: TypeCastingError()))
        }
        
        cell.textLabel?.text = self.name
    }
}
