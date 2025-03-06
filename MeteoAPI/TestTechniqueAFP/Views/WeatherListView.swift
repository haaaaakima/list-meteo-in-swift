import SwiftUI

struct WeatcherListView: View {

    @State var viewModel: WeatherListViewModel = WeatherListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if (viewModel.isLoading) {
                    ProgressView()
                }
                VStack(spacing: 8) {
                    ForEach(viewModel.weatherDatafilter) { weather in
                        NavigationLink {
                            WeatherDetailView(viewModel: WeatherDetailViewModel(weather: weather))
                        } label: {
                            WeatherCardView(weather: weather)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.refreshWeathers()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.refreshWeathers()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }

                }
            }
            .searchable(text: $viewModel.searchText, prompt: "Ville ou aéroport")
            .navigationTitle("Météo")
        }
    }
}

#Preview {
    WeatcherListView()
}
