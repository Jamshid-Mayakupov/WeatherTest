
import UIKit

open class MyView: UIView {
    public var compactConstraints = [NSLayoutConstraint]()
    public var regularConstraints = [NSLayoutConstraint]()
    public var sharedConstraints = [NSLayoutConstraint]()
    
    private var isRegular = true
    
    public init(corderRadius: CGFloat = 0, backgroundColor: UIColor = .clear) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = corderRadius
        self.backgroundColor = backgroundColor
        
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        updateUI()
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupTargets()
        style()
        localize()
    }
    
    open func setupSubviews() {
        
    }
    
    open func setupConstraints() {
        
    }
    
    open func setupTargets() {
        
    }
    
    open func style() {
        
    }
    
    open func localize() {
        
    }
    
    func updateUI() {
        let bounds = window?.bounds ?? UIScreen.main.bounds
        isRegular = bounds.width > bounds.height
        
        if sharedConstraints.count > 0 && (!sharedConstraints[0].isActive) {
            // activating shared constraints
            NSLayoutConstraint.activate(sharedConstraints)
        }
        
        if isRegular == false {
            if regularConstraints.count > 0 && regularConstraints[0].isActive {
                NSLayoutConstraint.deactivate(regularConstraints)
            }
            // activating compact constraints
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            if compactConstraints.count > 0 && compactConstraints[0].isActive {
                NSLayoutConstraint.deactivate(compactConstraints)
            }
            // activating regular constraints
            NSLayoutConstraint.activate(regularConstraints)
        }
        
//        if self.traitCollection.userInterfaceIdiom == .pad {    // If current device is iPad.
//            //            let isPortrait = UIApplication.shared.statusBarOrientation.isPortrait
//            //            if isPortrait { // For portrait orientation.
//            //                let wC = UITraitCollection(horizontalSizeClass: .compact)
//            //                let hR = UITraitCollection(verticalSizeClass: .regular)
//            //                let customTrait = UITraitCollection(traitsFrom: [wC, hR])
//            //                view.traitCollectionDidChange(customTrait)
//            ////                setOverrideTraitCollection(customTrait, forChild: self)
//            //            } else {    // For landscape orientation.
//
//            if bounds.width < bounds.height {
//                let wC = UITraitCollection(horizontalSizeClass: .compact)
//                let hR = UITraitCollection(verticalSizeClass: .regular)
//                let customTrait = UITraitCollection(traitsFrom: [wC, hR])
//                traitCollectionDidChange(customTrait)
//                //                    setOverrideTraitCollection(customTrait, forChild: self)
//            } else {
//                let wR = UITraitCollection(horizontalSizeClass: .regular)
//                let hR = UITraitCollection(verticalSizeClass: .regular)
//                let customTrait = UITraitCollection(traitsFrom: [wR, hR])
//                traitCollectionDidChange(customTrait)
//                //                    setOverrideTraitCollection(customTrait, forChild: self)
//            }
//            //            }
//        }
    }
}
