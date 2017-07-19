import Foundation
import UIKit

public enum FilterType: Int {
    case brightness = 0
    case rgb = 1
    case contrast = 2
}

public extension UIImage {
    
    static func apply(filter: Filter, inout onImage image: UIImage) {
        let imageProcessor = ImageProcessor()
        imageProcessor.apply(filter, onImage: &image)
    }
}
