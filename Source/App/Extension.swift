//
//  Extension.swift
//  BouncyAR
//
//  Created by Bjarne Lundgren on 19/08/2017.
//  Copyright © 2017 Silicon.dk ApS. All rights reserved.
//

import Foundation
import SceneKit

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}

extension UIView {
    @objc static public var uid: String {
        String(describing: self)
    }
}

public extension UIColor {
    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init()
        } else {
            
            var rgbValue:UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)
            
            
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: CGFloat(1.0))
        }
    }
}

public func isDevice(_ device: UIUserInterfaceIdiom) -> Bool {
    UIDevice.current.userInterfaceIdiom == device
}

extension UIViewController {
    public func loadChild(_ viewController: UIViewController, onView: UIView?) {
        //        let view: UIView = onView ?? self.view
        
        // `willMoveToParentViewController:` is called automatically when adding
        addChild(viewController)
        
        if let view = onView {
            viewController.view.frame = view.bounds
            viewController.view.translatesAutoresizingMaskIntoConstraints = true
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            view.addSubview(viewController.view)
        }
        
        viewController.didMove(toParent: self)
    }
    
    public func unloadChild(_ viewController: UIViewController?) {
        guard let viewController = viewController else {
            return
        }
        
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
        // `didMoveToParentViewController:` is called automatically when removing
    }
    
//    func changeRoot(to vc: UIViewController) {
//        guard let root = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        
//        UIView.transition(from: view, to: vc.view, duration: 0.4, options: .transitionCrossDissolve) { done in
//            if done {
//                root.window?.rootViewController = vc
//                root.window?.makeKeyAndVisible()
//            }
//        }
//    }
}

extension UIImage {
    

    
    func imageRotated(on degrees: CGFloat) -> UIImage {
        // Following code can only rotate images on 90, 180, 270.. degrees.
        let degrees = round(degrees / 90) * 90
        let sameOrientationType = Int(degrees) % 180 == 0
        let radians = CGFloat.pi * degrees / CGFloat(180)
        let newSize = sameOrientationType ? size : CGSize(width: size.height, height: size.width)
        
        UIGraphicsBeginImageContext(newSize)
        defer {
            UIGraphicsEndImageContext()
        }
        
        guard let ctx = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
            return self
        }
        
        ctx.translateBy(x: newSize.width / 2, y: newSize.height / 2)
        ctx.rotate(by: radians)
        ctx.scaleBy(x: 1, y: -1)
        let origin = CGPoint(x: -(size.width / 2), y: -(size.height / 2))
        let rect = CGRect(origin: origin, size: size)
        ctx.draw(cgImage, in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image ?? self
    }
    
    
      func imageAnyRotated(on degrees: CGFloat) -> UIImage {
        // Following code can only rotate images on 90, 180, 270.. degrees.
  //      let degrees = round(degrees / 90) * 90
        let sameOrientationType = Int(degrees) % 180 == 0
        let radians = CGFloat.pi * degrees / CGFloat(180)
        let newSize = sameOrientationType ? size : CGSize(width: size.height, height: size.width)

        UIGraphicsBeginImageContext(newSize)
        defer {
          UIGraphicsEndImageContext()
        }

        guard let ctx = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
          return self
        }

        ctx.translateBy(x: newSize.width / 2, y: newSize.height / 2)
        ctx.rotate(by: radians)
        ctx.scaleBy(x: 1, y: -1)
        let origin = CGPoint(x: -(size.width / 2), y: -(size.height / 2))
        let rect = CGRect(origin: origin, size: size)
        ctx.draw(cgImage, in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image ?? self
      }

    
    convenience init?(view: UIView?) {
        guard let view: UIView = view else { return nil }
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        view.layer.render(in: context)
        let contextImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard
            let image: UIImage = contextImage,
            let pngData: Data = image.pngData()
        else { return nil }
        
        self.init(data: pngData)
    }
    
}

extension UIButton {
    static func makeButton(type: ButtonType = .system,
                           title: String? = nil,
                           image: UIImage? = nil,
                           tintColor: UIColor = Color.textBlack,
                           backgroundColor: UIColor = Color.white,
                           cornerRadius: CGFloat = 0,
                           contentInsets: UIEdgeInsets = .zero) -> UIButton
    {
        let btn = UIButton(type: type)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(title, for: .normal)
        btn.setImage(image, for: .normal)
        btn.tintColor = tintColor
        btn.backgroundColor = backgroundColor
//        btn.contentEdgeInsets = contentInsets
        
        if cornerRadius > 0 {
            btn.layer.cornerRadius = cornerRadius
            btn.layer.masksToBounds = false
            btn.clipsToBounds = true
        }
        
        return btn
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
