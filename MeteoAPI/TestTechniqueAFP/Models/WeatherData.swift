import SwiftUI
import Foundation

struct WeatherData: Decodable {
    
// API :
    let temp : Double
    let tempMin : Double
    let tempMax: Double
    let humidity: Int
    
// Others :
    var temperatureCelcius: Int {
        Int(temp - 273.15)
    }
    var temperatureFahrenheit: Int {
        Int(temperatureCelcius * 9/5) + 32
    }
    
// Decodable: 
    // Enum un peu special afin de pouvoir utiliser les noms qu'on souhaite en propriété,
    // par rapport au nom des propriété que l'API nous renvoie.
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}
