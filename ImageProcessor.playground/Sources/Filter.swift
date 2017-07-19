import Foundation

public enum FilteringType: String {
    case rgb = "rgb"
    case brightness = "brightness"
//    case grayScale = "grayScale"
}

public struct Filter {
    let type: FilteringType?
    let intensity: Int?
    
    public init(type: FilteringType, intensity: Int) {
        self.type = type
        self.intensity = intensity
    }
}