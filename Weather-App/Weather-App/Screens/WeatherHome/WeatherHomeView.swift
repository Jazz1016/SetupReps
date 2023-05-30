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
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    if let weather = currentWeather {
                        VStack {
                            Text("Current Weather Condition")
                                .font(.title)
                            
                            HStack {
                                VStack {
                                    //                                let dateStr = Helpers.formatTimeIntervalToString(from: forecast.dt)
                                    //
                                    //                                let tempFahrenheit = Helpers.kelvinToFahrenheit(forecast.main.temp)
                                    //
                                    //                                let windSpeed = Helpers.metersPerSecondToMilesPerHour(forecast.wind.speed)
                                    
                                    Text("\(weather.main.temp ?? 1)°F")
                                    
                                    Text("\(weather.weather[0].description ?? "goyim description")")
                                    
                                    Text("\(Helpers.kelvinToFahrenheit(weather.main.temp ?? 9))")
                                    
                                    Text("")
                                }
                                WeatherRemoteImage(urlString: currentWeather?.imageURL ?? "")
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                            }
                        }
                    } else {
                        LoadingView()
                    }
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(weatherForcast) { forecast in
                                VerticalWeatherCell(forecast: forecast)
                            }
                            .padding()
                        }
                    }
                }
                .onAppear {
                    fetchCurrentWeather()
                    fetchWeather()
                }
                .navigationTitle("😎 Weather Report")
                .toolbarBackground(Color.brandPrimary,for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            
            if isLoading {
                LoadingView()
            }
            
        }
        .accentColor(Color.accentColor)
        .background(Color.black)
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
        isLoading = true
        Task {
            do {
                self.weatherForcast = try await NetworkManager.shared.fetchWeatherForecasts()
                isLoading = false
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
                isLoading = false
            }
        }
    }
    
}

struct WeatherHomeView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHomeView()
    }
}
