import Foundation
import Observation


// MARK: - VERSION 1 plus recent et plus simple avec @Observable:
// (penser à rajouter le "import Observation" au dessus)

@Observable
class WeatherListViewModel {
    
    var weathers: [WeatherCity] = []
    var searchText: String = ""
    var isLoading = false
    
    var weatherDatafilter: [WeatherCity] {
        guard !searchText.isEmpty else {
            return weathers
        }
        return weathers.filter {
            $0.city.lowercased().contains(searchText.lowercased())
        }
    }
    
    
    // MARK: - API Service
    let apiKey = "VOTRE_API_KEY" // allez chercher votre clé API sur https://home.openweathermap.org/api_keys ;)
    
    // Remplir la liste de meteo de ville (weathers)
    func refreshWeathers() {
        Task {
            isLoading = true
            var newWeathers: [WeatherCity] = []
            // Appel API
            for city in cities {
                if let weather = await getWeather(city: city) {
                    newWeathers.append(weather)
                }
            }
            weathers = newWeathers
            isLoading = false
        }
    }
    
    // Pour récupérer les données météo d'une seule ville grâce à l'appel API
    func getWeather(city: City) async -> WeatherCity? {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)"
        
        // On convertit l'url de type String en type URL qui sera necessaire pour la fonction URLSession
        guard let url = URL(string: urlString) else {
            print("URL invalide pour la ville \(city.name)")
            return nil
        }
        
        do {
            // Function mise à dispo par Apple pour recuperer les datas d'une API / d'un serveur.
            // Appel reseau
            let (data, _) = try await URLSession.shared.data(from: url) // try = on essaye d'executer la fonction
            
            // Uniquement pour le dev -> On convertit les données recues en une String lisible, utile pour débogage
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON brut reçu : \(jsonString)")
            } else {
                print("Impossible de convertir les données en String.")
            }
            
            // On convertit les données envoyées par l'API en un objet qui correspond à notre model de données
            let weatherCity: WeatherCity = try JSONDecoder().decode(WeatherCity.self, from: data)
            
            // On print le resultat au format de notre model / structure
            print(weatherCity)
            
            return weatherCity
            
        } catch {
            // Si erreur parmi les fonctions "try", on "l'attrape" et on rentre dans le catch
            print("Erreur de récupération pour \(city) : \(error)")
            return nil
        }
    }
    
}
