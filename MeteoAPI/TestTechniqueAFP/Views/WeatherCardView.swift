import SwiftUI

struct WeatherCardView: View {
    
    var weather: WeatherCity
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(weather.city)
                    .font(.title)
                    .fontWeight(.bold)
                    .shadow(radius: 10)
                Text(weather.time)
                    .font(.caption)
                Spacer()
                Text(weather.conditionsData.title)
                    .font(.caption)
            }
            Spacer()
            VStack {
                Text("\(weather.data?.temperatureCelcius ?? 0)°")
                    .font(.system(size: 50))
                    .shadow(radius: 10)
                
                if let alert = weather.meteoAlert {
                    HStack(alignment: .top) {
                        Text("Alerte")
                        Circle()
                            .foregroundStyle(alert.color)
                            .frame(width: 20, height: 20)
                        
                            
                    }
                }
            }
            
        }
        .foregroundStyle(.white)
        .padding()
        .frame(height: 120)
        .background(
            Image(weather.conditionsData.image)
                .resizable()
                .scaledToFill()
        )
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

#Preview {
    WeatherCardView(weather: weatherCityFake)
}
