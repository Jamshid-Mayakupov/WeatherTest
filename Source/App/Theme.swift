//
//  Theme.swift
//  Flowers Garden
//
//  Created by Jamshid on 30/08/21.
//

import UIKit

public struct FontSize {
    static var xs: CGFloat {
        if isDevice(.pad) {
            return 10
        } else {
            return 6
        }
    }
    
    static var s: CGFloat {
        if isDevice(.pad) {
            return 12
        } else {
            return 8
        }
    }
    
    static var m: CGFloat {
        if isDevice(.pad) {
            return 17
        } else {
            return 15
        }
    }
    
    static var l: CGFloat {
        if isDevice(.pad) {
            return 32
        } else {
            return 21
        }
    }
    
    static var xl: CGFloat {
        if isDevice(.pad) {
            return 41
        } else {
            return 26
        }
    }
}


public struct Padding {
    static var s: CGFloat {
        if isDevice(.pad) {
            return 8
        } else {
            return 4
        }
    }
    
    static var m: CGFloat {
        if isDevice(.pad) {
            return 16
        } else {
            return 8
        }
    }
    
    static var l: CGFloat {
        if isDevice(.pad) {
            return 32
        } else {
            return 16
        }
    }
}

struct Color {
    static let background = UIColor(hex: "#FAFAFA")
    
    static let white = UIColor(hex: "#FFFFFF")
    
    static let label = UIColor(hex: "#808080")
    
    static let fieldOnWhite = UIColor(red: 43, green: 43, blue: 43, alpha: 0.4)
    
    static let disabled = UIColor(hex: "#CDCDCD")
    
    static let green = UIColor(hex: "#53AB69")
    
    static let lightGreen = UIColor(hex: "#75D28C")
    
    static let darkGreen = UIColor(hex: "#279342")
    
    static let textGreen = UIColor(hex: "#00661A")
    
    static let textBlack = UIColor(hex: "#000000")
    
    static let textLinkGreen = UIColor(hex: "#2FB350")
    
    static let textSecondary = UIColor(hex: "#656565")
    
    static let textDisabled = UIColor(red: 60, green: 60, blue: 67, alpha: 0.3)
    
    static let tagNew = UIColor(hex: "#FF6961")
    
    static let tagHit = UIColor(hex: "#FF9500")
    
    static let tagSale = UIColor(hex: "#5AC8FA")
    
    
//    static let primaryColor = UIColor(hex: "#53AB69")
//
//    static let secondaryColor = UIColor(hex: "#d8e9dd")
//
//    static let blackColor = UIColor(hex: "000000")
//
//    static let whiteColor = UIColor(hex: "FFFFFF")
//
//    static let darkTextColor = UIColor(hex: "3F3F46")
//
//    static let lightTextColor = UIColor(hex: "686868")
//
//    static let viewBackground = UIColor(hex: "FAFAFA")
//
//    static let inputBackground = UIColor(hex: "F8F8F8")
//
//    static let inputBorder = UIColor(hex: "EBEEF0")
}
