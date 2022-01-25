import UIKit

import Pretendard

public final class StoreCollectionSupplementaryView: UICollectionReusableView {
    public let textLabel: UILabel
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        
        let textLabel = self.textLabel
        textLabel.font = try? .pretendardFont(ofSize: 14.0, weight: .regular)
        textLabel.textColor = .label
        
        self.addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            self.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 20.0),
            self.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 12.0)
        ])
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}
