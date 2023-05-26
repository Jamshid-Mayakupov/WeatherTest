
import UIKit

open class MyScrollView: UIScrollView {
    
    public let contentView = MyView()
    
    public init(alwaysBounceVertical: Bool = true, backgroundColor: UIColor = .clear) {
        super.init(frame: .zero)
        
        self.alwaysBounceVertical = alwaysBounceVertical
        self.backgroundColor = backgroundColor
        
        setupContentView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupContentView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.heightAnchor),
        ])
    }
}
