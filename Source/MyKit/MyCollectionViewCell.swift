//
//  File.swift
//  
//
//  Created by My on 30/08/21.
//

import UIKit

open class MyCollectionViewCell: UICollectionViewCell {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupTargets()
        localize()
        style()
    }
    
    open func setupSubviews() {
        
    }
    
    open func setupConstraints() {
        
    }
    
    open func setupTargets() {
        
    }
    
    open func localize() {
        
    }
    
    open func style() {
        
    }
}
