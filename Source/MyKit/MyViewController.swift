import UIKit

open class MyViewController: UIViewController {
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setupTargets()
        setupObservers()
        localize()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
//        guard let root = super else {
//            super.present(viewControllerToPresent, animated: true)
//            return
//        }
        
        if let vc = self.presentedViewController {
            presentIn(vc, viewControllerToPresent: viewControllerToPresent, animated: flag, completion: completion)
        } else {
            super.present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }
    
    private func presentIn(_ presentedViewController: UIViewController, viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        
        if let vc = presentedViewController.presentedViewController {
            presentIn(vc, viewControllerToPresent: viewControllerToPresent, animated: flag, completion: completion)
        } else {
            presentedViewController.present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }
    
    open func setupTargets() {
        
    }
    
    open func setupObservers() {
        
    }
    
    open func localize() {
        
    }
}
