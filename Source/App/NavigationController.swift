//
//  NavigationController.swift
//  Flowers Garden
//
//  Created by Jamshid on 26/08/21.
//

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
    }
    
    private func style() {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            navigationBar.scrollEdgeAppearance = appearance
        }
        
        navigationBar.tintColor = .darkGray
//        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
//        navigationBar.isOpaque = true
        
//        navigationBar.isHidden = true
    }
}
