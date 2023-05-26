
import UIKit

public enum TextFieldType: Int {
    case number
    case expires
    case cvv
    case ccNumber
    case name
    case firstName
    case lastName
    case passportID
    case sex
    case birthday
    case dateOfIssue
    case dateOfExpiry
    case money
    case phone
    case sms
    case text
    case date
    case select
    case password
    
    public var keyboard: UIKeyboardType {
        switch self {
        case .ccNumber, .cvv, .number, .dateOfExpiry, .dateOfIssue, .expires, .phone, .sms, .date:
            return .numberPad
        case .money:
            return .decimalPad
        default:
            return .default
        }
    }
}

open class MyTextField: UITextField {
    public var padding: UIEdgeInsets!
    
    public let bottomLine = MyView()
    
    open var type: TextFieldType = .name {
        didSet {
            keyboardType = type.keyboard
            tag = type.rawValue
        }
    }
    
    public var amount: Double = 0
    
    
    
    public var selectedValueId = -1
    
    public var selectedValueTitle: String? {
        didSet {
            text = selectedValueTitle
        }
    }
    
    public init(type: TextFieldType = .name, padding: UIEdgeInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0), withBottomLine: Bool = false) {
        super.init(frame: .zero)
        
        self.padding = padding
        self.type = type
        
        keyboardType = type.keyboard
        tag = type.rawValue
        
        bottomLine.isHidden = !withBottomLine
        
        bottomLine.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        self.addTarget(self, action: #selector(textDidChange(_:)), for: .allEditingEvents)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        layout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}

extension MyTextField {
    @objc public func textDidChange(_ textField: MyTextField) {
        
    }
    
    
    
    private func layout() {
        
    }
}
