import UIKit

import ErrorKit

public final class MainView: UIView {
    public let collectionView: UICollectionView
    
    public override init(frame: CGRect) {
        let collectionViewLayout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(44.0)
                ),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            sectionHeader.pinToVisibleBounds = true
            
            let section: NSCollectionLayoutSection
            
            if layoutEnvironment.traitCollection.userInterfaceIdiom == .pad {
                section =  NSCollectionLayoutSection(
                    group: .horizontal(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .fractionalWidth(1.0),
                            heightDimension: .estimated(
                                max(
                                    layoutEnvironment.container.effectiveContentSize.width / 4.0,
                                    layoutEnvironment.container.effectiveContentSize.height / 4.0
                                )
                            )
                        ),
                        subitems: [
                            NSCollectionLayoutItem(
                                layoutSize: NSCollectionLayoutSize(
                                    widthDimension: .fractionalWidth(0.25),
                                    heightDimension: .fractionalHeight(1.0)
                                )
                            ),
                            NSCollectionLayoutItem(
                                layoutSize: NSCollectionLayoutSize(
                                    widthDimension: .fractionalWidth(0.25),
                                    heightDimension: .fractionalHeight(1.0)
                                )
                            ),
                            NSCollectionLayoutItem(
                                layoutSize: NSCollectionLayoutSize(
                                    widthDimension: .fractionalWidth(0.25),
                                    heightDimension: .fractionalHeight(1.0)
                                )
                            ),
                            NSCollectionLayoutItem(
                                layoutSize: NSCollectionLayoutSize(
                                    widthDimension: .fractionalWidth(0.25),
                                    heightDimension: .fractionalHeight(1.0)
                                )
                            )
                        ]
                    )
                )
            } else {
                section =  NSCollectionLayoutSection(
                    group: .horizontal(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .fractionalWidth(1.0),
                            heightDimension: .estimated(
                                max(
                                    layoutEnvironment.container.effectiveContentSize.width / 2.0,
                                    layoutEnvironment.container.effectiveContentSize.height / 4.0
                                )
                            )
                        ),
                        subitems: [
                            NSCollectionLayoutItem(
                                layoutSize: NSCollectionLayoutSize(
                                    widthDimension: .fractionalWidth(0.5),
                                    heightDimension: .fractionalHeight(1.0)
                                )
                            ),
                            NSCollectionLayoutItem(
                                layoutSize: NSCollectionLayoutSize(
                                    widthDimension: .fractionalWidth(0.5),
                                    heightDimension: .fractionalHeight(1.0)
                                )
                            )
                        ]
                    )
                )
            }
            
            section.boundarySupplementaryItems = [
                sectionHeader
            ]
            
            return section
        }
        
        self.collectionView = UICollectionView(frame: frame, collectionViewLayout: collectionViewLayout)
        
        super.init(frame: frame)
        
        self.configure()
        self.configureCollectionView()
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}

extension MainView {
    private func configure() {
        self.backgroundColor = .systemBackground
    }
    
    private func configureCollectionView() {
        let refreshControl = UIRefreshControl()
        
        let collectionView = self.collectionView
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: Product.self))
        collectionView.register(StoreCollectionSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: Store.self))
        collectionView.refreshControl = refreshControl
    }
    
    private func configureViewHierarchies() {
        let collectionView = self.collectionView
        
        self.addSubview(collectionView)
    }
    
    private func configureLayoutConstraints() {
        let collectionView = self.collectionView
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
        ])
    }
}
