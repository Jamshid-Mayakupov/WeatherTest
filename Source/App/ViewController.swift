//
//  ViewController.swift
//  ImzoReality
//
//  Created by Jamshid on 17/11/21.
//

import UIKit

class ViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTargets()
        setupObservers()
        localize()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setupTargets() { }
    
    open func setupObservers() { }
    
    open func localize() { }
}
