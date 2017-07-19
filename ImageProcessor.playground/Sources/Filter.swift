import Foundation

public enum FilteringType: String {
    case rgb = "rgb"
    case brightness = "brightness"
//    case grayScale = "grayScale"
}

public enum PreDefinedFilters: String {
    case addBrightnessBy80 = "increaseBrightnessBy80"
    case reduceBrightnessBy90 = "decreaseBrightnessBy90"
    case addRgbBy20 = "addRgbBy20"
}

public class Filter {
    let type: FilteringType
    let intensity: Int
    
    public init(type: FilteringType, intensity: Int) {
        self.type = type
        self.intensity = intensity
    }
    
    public convenience init(predefinedFilter: PreDefinedFilters) {
        switch predefinedFilter {
        case .addBrightnessBy80:
            self.init(type: .brightness, intensity: 80)
            break
        case .reduceBrightnessBy90:
            self.init(type: .brightness, intensity: -90)
            break
        case .addRgbBy20:
            self.init(type: .rgb, intensity: 20)
            break
        }
    }
}