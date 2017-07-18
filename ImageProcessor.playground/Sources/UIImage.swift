import Foundation
import UIKit

public enum FilteringType: Int {
    case brightness = 0
    case rgb = 1
    case contrast = 2
}

public extension UIImage {
    
    static func applyFilter(withAmount amount: Int, filteringType type: FilteringType, inout onImage image: UIImage) {
        let imageProcessor = ImageProcessor()
        imageProcessor.applyFilter(withAmount: amount, onImage: &image)
    }
}
