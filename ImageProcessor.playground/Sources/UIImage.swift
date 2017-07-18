import Foundation
import UIKit

public extension UIImage {
    
    //TODO: Use image processor to return filtered images through UIImage interface funcs
    static func filter(inout image: UIImage) {
        let imageProcessor = ImageProcessor()
        imageProcessor.applyFilter(onImage: &image)
    }
}
