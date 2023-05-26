
import UIKit


final class ContentSizedTableView: UITableView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}


open class MyTableView: UITableView {
    public init(style: UITableView.Style = .plain, separatorStyle: UITableViewCell.SeparatorStyle = .none, backgroundColor: UIColor = .clear) {
        super.init(frame: .zero, style: style)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = UITableView.automaticDimension
        self.separatorStyle = separatorStyle
        self.backgroundColor = backgroundColor
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
