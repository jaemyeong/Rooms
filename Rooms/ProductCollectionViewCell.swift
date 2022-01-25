import UIKit

public final class ProductCollectionViewCell: UICollectionViewCell {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(
            red: .random(in: 0.0...1.0),
            green: .random(in: 0.0...1.0),
            blue: .random(in: 0.0...1.0),
            alpha: 1.0
        )
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}
