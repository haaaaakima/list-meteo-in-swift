import Foundation

class WeatherDetailViewModel: ObservableObject {
    
    @Published var isCelcius: Bool = true
    
    let weather: WeatherCity
    
    init(weather: WeatherCity) {
        self.weather = weather
    }
    
    // MARK: - Private Properties

    private var temperature: String {
        "\(weather.data?.temperatureCelcius ?? 0) °C"
    }
    
    private var temperatureFahrenheit : String {
        "\(weather.data?.temperatureFahrenheit ?? 0) °F"
    }
    
    // MARK: - Properties
    
    var temperatureText: String {
        isCelcius ? temperature : temperatureFahrenheit
    }
    
    var temperatureUnitText: String {
        isCelcius ? "La température est en celcius" : "La température est en fahrenheit"
    }
    
    
    // MARK: - Functions
    func toggleTemperatureUnit() {
        isCelcius.toggle()
    }

}
