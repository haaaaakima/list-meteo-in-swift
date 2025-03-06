import SwiftUI
import Foundation

struct WeatherDescription: Decodable {
    
// API :
    let condition: WeatherCondition
    
// Decodable :
    enum CodingKeys: String, CodingKey {
        case condition = "main"
    }
}
