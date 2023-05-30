//
//  ContentView.swift
//  Weather-App
//
//  Created by James Lea on 5/26/23.
//

import SwiftUI

struct WeatherHomeView: View {
    
    @StateObject var viewModel = WeatherHomeViewModel()
    @State var weatherForcast: [WeatherData] = []
    @State var alertItem: AlertItem?
    
    var body: some View {
        VStack {
            HStack {
                ForEach(weatherForcast) { forecast in
                    VStack {
                        let dateStr = Helpers.formatTimeIntervalToString(from: forecast.dt)
                        Text("\(dateStr)")
                            .padding()
                        Text("\(Int(forecast.main.temp))")
                        Text("\(forecast.weather[0].main)")
                        Text("\(forecast.weather[0].description)")
                    }
                }
            }
        }
        .onAppear {
            fetchWeather()
        }
    }
    
    func fetchWeather() {
        Task {
            do {
                self.weatherForcast = try await NetworkManager.shared.fetchWeatherForecasts()
            } catch {
                if let wError = error as? WError {
                    switch wError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
}

struct WeatherHomeView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHomeView()
    }
}
