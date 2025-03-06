import Foundation
import SwiftUI

enum WeatherCondition: String, Decodable {
    case clear = "Clear"
    case cloudy = "Clouds"
    case rainy = "Rain"
    case snowy = "Snow"
    case sunny = "Sun"
    
    var image: ImageResource {
        switch self {
        case .clear:
            return .beautifulClearing
        case .cloudy:
            return .clouds
        case .rainy:
            return .rain
        case .snowy:
            return .snow
        case .sunny:
            return .sun
        }
    }
    
    var title: String {
        switch self {
        case .clear:
            return "Ciel clair"
        case .cloudy:
            return "Nuageux"
        case .rainy:
            return "Pluvieux"
        case .snowy:
            return "Neigeux"
        case .sunny:
            return "Ensoleillé"
        }
    }
    
}
