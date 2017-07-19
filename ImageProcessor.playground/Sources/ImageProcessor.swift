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
    var filterType: FilterType?
    var amount: Int = 0
    
    init() {}
    
    func applyFilter(type: FilterType, amount: Int, inout onImage image: UIImage) {
        self.image = image
        self.filterType = type
        self.amount = amount
        
        if let type = filterType {
            switch type {
            case .brightness:
                updateBrightness(onImage: &image)
                break
            case .rgb:
                updateRGB(onImage: &image)
                break
            case .contrast:
                updateContrast(onImage: &image)
                break
            }
        }
    }
    
    //MARK: Filtering operations
    private func updateBrightness(inout onImage image: UIImage) {
        for (index, _) in rgbImage!.pixels.enumerate() {
            var r = Int(rgbImage!.pixels[index].red) + amount
            var g = Int(rgbImage!.pixels[index].green) + amount
            var b = Int(rgbImage!.pixels[index].blue) + amount
            
            verifyIfItsInRange(&r)
            verifyIfItsInRange(&g)
            verifyIfItsInRange(&b)
            
            rgbImage!.pixels[index].red = UInt8(r)
            rgbImage!.pixels[index].green = UInt8(g)
            rgbImage!.pixels[index].blue = UInt8(b)
        }
        
        self.image = rgbImage?.toUIImage()
        image = self.image!
    }
    
    private func updateRGB(inout onImage image: UIImage) {
        let averages = getAverageRGB()
        var differences: [Int]
        for (index, pixel) in rgbImage!.pixels.enumerate() {
            differences = pixelRGBDiff(fromPixel: pixel, toAverages: averages)
            let filteredRGB = newRGB(forPixel: pixel, withDifference: differences, averages: averages, amount: amount)
            
            //
            if let red = filteredRGB[RGB.red.rawValue] {
                rgbImage!.pixels[index].red = red
            }
            if let green = filteredRGB[RGB.green.rawValue] {
                rgbImage!.pixels[index].green = green
            }
            if let blue = filteredRGB[RGB.blue.rawValue] {
                rgbImage!.pixels[index].blue = blue
            }
        }
        
        self.image = rgbImage?.toUIImage()
        image = self.image!
    }
    
    private func updateContrast(inout onImage image: UIImage) {
        
    }
    
    //MARK: Helper functions
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
    
    
    private func pixelRGBDiff(fromPixel pixel: Pixel, toAverages avgs: [Int]) -> [Int] {
        var differences = [Int]()
        differences.append(Int(pixel.red) - avgs[RGB.red.rawValue])
        differences.append(Int(pixel.green) - avgs[RGB.green.rawValue])
        differences.append(Int(pixel.blue) - avgs[RGB.blue.rawValue])
        
        return differences
    }
    
    private func newRGB(forPixel pixel: Pixel, withDifference diff: [Int], averages avgs: [Int], amount: Int) -> [UInt8?] {
        //FIXME: Change new value not just multipling but adding, subtracting and dividing
        var newRGB = [UInt8?]()
        if diff[RGB.red.rawValue] > 0 {
            newRGB.append(UInt8(max(0, min(255, avgs[RGB.red.rawValue] + diff[RGB.red.rawValue] + amount))))
        }
        else {
            newRGB.append(nil)
        }
        if diff[RGB.green.rawValue] > 0 {
            newRGB.append(UInt8(max(0, min(255, avgs[RGB.green.rawValue] + diff[RGB.green.rawValue] + amount))))
        }
        else {
            newRGB.append(nil)
        }
        if diff[RGB.blue.rawValue] > 0 {
            newRGB.append(UInt8(max(0, min(255, avgs[RGB.blue.rawValue] + diff[RGB.blue.rawValue] + amount))))
        }
        else {
            newRGB.append(nil)
        }
        
        return newRGB
    }
    
    private func verifyIfItsInRange(inout value: Int) {
        if (value >= 256) {
            value = 255
        } else if (value < 0) {
            value = 0
        }
    }
}
