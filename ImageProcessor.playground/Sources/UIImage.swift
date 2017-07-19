import Foundation
import UIKit

public extension UIImage {
    static func apply(filters: [Filter], inout onImage image: UIImage) {
        let imageProcessor = ImageProcessor(filters: filters)
        imageProcessor.applyFilters(onImage: &image)
    }
}
