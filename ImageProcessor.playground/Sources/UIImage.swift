import Foundation
import UIKit

public enum FilterType: Int {
    case brightness = 0
    case rgb = 1
    case contrast = 2
}

public enum FilterOperation: Int {
    case increase = 0
    case decrease = 1
}

public extension UIImage {
    
    static func applyFilter(withAmount amount: Int, operation: FilterOperation, type: FilterType, inout onImage image: UIImage) {
        let imageProcessor = ImageProcessor()
        imageProcessor.applyFilter(type, amount: amount, onImage: &image)
    }
}
