import Foundation
import UIKit

public enum RGB: Int {
    case red = 0
    case green = 1
    case blue = 2
}

class ImageProcessor {
    
    var rgbImage: RGBAImage?
    var image: UIImage? {
        didSet {
            if let image = image {
                rgbImage = RGBAImage(image: image)
            }
        }
    }
    
    init() {}
    
    private func getAverageRGB() -> [Int]{
        var totalRed = 0
        var totalGreen = 0
        var totalBlue = 0
        
        for y in 0..<rgbImage!.height {
            for x in 0..<rgbImage!.width {
                let index = y * rgbImage!.width + x
                var pixel = rgbImage!.pixels[index]
                
                totalRed += Int(pixel.red)
                totalGreen += Int(pixel.green)
                totalBlue += Int(pixel.blue)
            }
        }
        
        let count = rgbImage!.width * rgbImage!.height
        let avgRed = totalRed/count
        let avgGreen = totalGreen/count
        let avgBlue = totalBlue/count
        
        return [avgRed, avgBlue, avgGreen]
    }
    
    //first basic filter
    func applyFilter(inout onImage image: UIImage) {
        //get image averages
        self.image = image
        let averages = getAverageRGB()
        
        for y in 0..<rgbImage!.height {
            for x in 0..<rgbImage!.width {
                let index = y * rgbImage!.width + x
                var pixel = rgbImage!.pixels[index]
                
                let differences = pixelRGBDiff(fromPixel: pixel, toAverages: averages)
                let filteredRGB = newRGB(forPixel: pixel, withDifference: differences, averages: averages)
                
                //see if has value
                if let red = filteredRGB[RGB.red.rawValue] {
                    pixel.red = red
                }
                if let green = filteredRGB[RGB.green.rawValue] {
                    pixel.green = green
                }
                if let blue = filteredRGB[RGB.blue.rawValue] {
                    pixel.blue = blue
                }
                
                rgbImage!.pixels[index] = pixel
            }
        }
        
        self.image = rgbImage?.toUIImage()
        image = self.image!
    }
    
    private func pixelRGBDiff(fromPixel pixel: Pixel, toAverages avgs: [Int]) -> [Int] {
        var differences = [Int]()
        differences.append(Int(pixel.red) - avgs[RGB.red.rawValue])
        differences.append(Int(pixel.green) - avgs[RGB.green.rawValue])
        differences.append(Int(pixel.blue) - avgs[RGB.blue.rawValue])
        
        return differences
    }
    
    private func newRGB(forPixel pixel: Pixel, withDifference diff: [Int], averages avgs: [Int]) -> [UInt8?] {
        var newRGB = [UInt8?]()
        if diff[RGB.red.rawValue] > 0 {
            newRGB.append(UInt8(max(0, min(255, avgs[RGB.red.rawValue] + diff[RGB.red.rawValue] * 5))))
        }
        else {
            newRGB.append(nil)
        }
        if diff[RGB.green.rawValue] > 0 {
            newRGB.append(UInt8(max(0, min(255, avgs[RGB.green.rawValue] + diff[RGB.green.rawValue] * 5))))
        }
        else {
            newRGB.append(nil)
        }
        if diff[RGB.blue.rawValue] > 0 {
            newRGB.append(UInt8(max(0, min(255, avgs[RGB.blue.rawValue] + diff[RGB.blue.rawValue] * 5))))
        }
        else {
            newRGB.append(nil)
        }
        
        return newRGB
    }
}
