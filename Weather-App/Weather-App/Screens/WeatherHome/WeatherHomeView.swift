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
    @State var currentWeather: CurrentWeatherData? = nil
    @State var alertItem: AlertItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Current Condition")
                    Text("\(currentWeather?.main.temp ?? 1)")
                    
                    WeatherRemoteImage(urlString: currentWeather?.imageURL ?? "")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(weatherForcast) { forecast in
                            VStack {
                                let dateStr = Helpers.formatTimeIntervalToString(from: forecast.dt)
                                
                                let tempFahrenheit = Helpers.kelvinToFahrenheit(forecast.main.temp)
                                
                                let windSpeed = Helpers.metersPerSecondToMilesPerHour(forecast.wind.speed)
                                
                                Text("\(dateStr)")
                                    .padding()
                                WeatherRemoteImage(urlString: forecast.imageURL ?? "")
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                Text("\(Int(tempFahrenheit))° F")
                                Text("\(forecast.weather[0].main)")
                                Text("\(forecast.weather[0].description)")
                                Text("Humidity: \(forecast.main.humidity)")
                                Text("Wind Speed: \(windSpeed, specifier: "%.1f") MPH")
                            }
                        }
                    }
                }
            }
            .onAppear {
                fetchCurrentWeather()
                fetchWeather()
            }
            .navigationTitle("😎 Weather Report")
        }
    }
    
    func fetchCurrentWeather() {
        Task {
            do {self.currentWeather = try await NetworkManager.shared.fetchCurrentWeatherCondition()
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
