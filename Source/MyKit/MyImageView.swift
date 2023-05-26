
import UIKit

open class MyImageView: UIImageView {
    
    public init(image: UIImage? = nil, cornerRadius: CGFloat = 0, contentMode: ContentMode = .scaleAspectFit) {
        super.init(frame: .zero)
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        self.contentMode = contentMode
        self.image = image
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension UIImage {
    func blurredImage(with context: CIContext, radius: CGFloat, atRect: CGRect) -> UIImage? {
        guard let ciImg = CIImage(image: self) else { return nil }
        
        let cropedCiImg = ciImg.cropped(to: atRect)
        let blur = CIFilter(name: "CIGaussianBlur")
        blur?.setValue(cropedCiImg, forKey: kCIInputImageKey)
        blur?.setValue(radius, forKey: kCIInputRadiusKey)
        
        if let ciImgWithBlurredRect = blur?.outputImage?.composited(over: ciImg),
           let outputImg = context.createCGImage(ciImgWithBlurredRect, from: ciImgWithBlurredRect.extent) {
            return UIImage(cgImage: outputImg)
        }
        return nil
    }
}
