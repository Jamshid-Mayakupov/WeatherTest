
import UIKit

open class MyCollectionView: UICollectionView {
    
    public init(scrollDirection: UICollectionView.ScrollDirection,
                itemSize: CGSize = CGSize(width: 10, height: 10),
                estimatedItemSize: CGSize = .zero,
                headerReferenceSize: CGSize = .zero,
                spacing: CGFloat = 10,
                sectionInset: UIEdgeInsets = UIEdgeInsets.zero,
                showsIndicatior: Bool = false) {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = itemSize
        layout.estimatedItemSize = estimatedItemSize
        layout.scrollDirection = scrollDirection
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = sectionInset
        layout.headerReferenceSize = headerReferenceSize
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        translatesAutoresizingMaskIntoConstraints = false
        alwaysBounceVertical = scrollDirection == .vertical
        alwaysBounceHorizontal = scrollDirection == .horizontal
        showsVerticalScrollIndicator = showsIndicatior
        showsHorizontalScrollIndicator = showsIndicatior
        contentInset = UIEdgeInsets.zero
        backgroundColor = .clear
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
