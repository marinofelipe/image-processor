import Foundation

public enum FilteringType: String {
    case rgb = "rgb"
    case brightness = "brightness"
//    case grayScale = "grayScale"
}

public enum PreDefinedFilters: String {
    case increaseBrightnessBy80 = "increaseBrightnessBy80"
    case increaseBrightnessBy150 = "decreaseBrightnessBy150"
    case reduceBrightnessBy90 = "decreaseBrightnessBy90"
    case increaseRgbBy20 = "addRgbBy20"
    case reduceRgbBy35 = "addRgbBy35"
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
        case .increaseBrightnessBy80:
            self.init(type: .brightness, intensity: 80)
            break
        case .increaseBrightnessBy150:
            self.init(type: .brightness, intensity: 150)
            break
        case .reduceBrightnessBy90:
            self.init(type: .brightness, intensity: -90)
            break
        case .increaseRgbBy20:
            self.init(type: .rgb, intensity: 20)
            break
        case .reduceRgbBy35:
            self.init(type: .rgb, intensity: -35)
            break
        }
    }
}