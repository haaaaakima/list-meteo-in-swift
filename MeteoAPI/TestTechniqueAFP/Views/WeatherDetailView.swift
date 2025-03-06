import SwiftUI

struct WeatherDetailView: View {
    
//    var weather: Weather
//    @State var isCelcius: Bool = true
    
    @ObservedObject var viewModel: WeatherDetailViewModel
    
    var body: some View {
        ZStack {
            Image(viewModel.weather.conditionsData.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Spacer()
                Text(viewModel.weather.city)
                    .font(.system(size: 40))
                    .fontWeight(.regular)
                Text(viewModel.weather.conditionsData.title)
                Text(viewModel.temperatureText)
                    .font(.system(size: 100))
                    .fontWeight(.regular)
                    .padding()
                Text(viewModel.temperatureUnitText)
                Spacer()
                Button {
                    viewModel.toggleTemperatureUnit()
                } label: {
                    Text(viewModel.isCelcius ? "Fahrenheit" : "Celcius")
                }
                
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    WeatherDetailView(viewModel: WeatherDetailViewModel(weather: weatherCityFake))
}
