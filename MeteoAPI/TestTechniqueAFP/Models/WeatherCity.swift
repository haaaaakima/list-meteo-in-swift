import SwiftUI
import Foundation

// MARK: - WeatherCity
struct WeatherCity: Decodable, Identifiable {
    
// API :
    
    let id: Int
    let city: String
    let description: [WeatherDescription]
    let data: WeatherData? // ici on peut mettre optionnel par exemple, par securité, si on est pas sur que le serveur nous renvoie des datas
    
// Others :
    
    // Une propriété qui nous interesse mais que l'API nous renvoie pas
    var meteoAlert: MeteoAlert?
    
    // Ici on fait une variable calculée pour récupéré la 1ere condition meteo,
    // car par default le serveur nous renvoie un tableau de condition... ca nous interesse peu, il nous en faut qu'une
    var conditionsData: WeatherCondition {
        return description.first?.condition ?? .cloudy
    }
    
    // Juste pour avoir l'heure actuel au bon format :
    var time: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // Format
        dateFormatter.locale = Locale(identifier: "fr_FR") // heure francaise
        return dateFormatter.string(from: Date()) // Retourne l'heure actuelle avec le bon format
    }
    
// Decodable :
    
    enum CodingKeys: String, CodingKey {
        case id
        case city = "name" // city le nom qu'on utilisera dans notre code, "name" c'est le nom de la data que l'API nous renvoie
        case description = "weather"
        case data = "main"
    }
}

// Exemple de data utile pour les previews
let weatherCityFake = WeatherCity(id: 1, city: "Nantes",
                                  description: [WeatherDescription(condition: .cloudy)],
                                  data: WeatherData(temp: 288.15, tempMin: 10, tempMax: 17, humidity: 60),
                                  meteoAlert: nil)
