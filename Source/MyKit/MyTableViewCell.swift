//
//  File.swift
//  
//
//  Created by My on 03/08/21.
//

import UIKit.UITableViewCell

open class MyTableViewCell: UITableViewCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupStyle()
        setupTargets()
    }
    
    open func setupSubviews() {
        
    }
    
    open func setupConstraints() {
        
    }
    
    open func setupStyle() {
        
    }
    
    open func setupTargets() {
        
    }
}
