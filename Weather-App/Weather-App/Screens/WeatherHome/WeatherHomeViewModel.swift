//
//  WeatherHomeViewModel.swift
//  Weather-App
//
//  Created by James Lea on 5/29/23.
//

import Foundation

final class WeatherHomeViewModel: ObservableObject {
    
    @Published var weatherForcast: [WeatherData] = []
    @Published var currentWeather: CurrentWeatherData? = nil
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingSettings = false
    @Published var city: City?
    
    func fetchCurrentWeather() {
        Task {
            do {
                let currentWeather = try await NetworkManager.shared.fetchCurrentWeatherCondition()
                
                DispatchQueue.main.async {
                    self.currentWeather = currentWeather
                    self.isLoading = false
                }
            } catch {
                handleWeatherError(error)
            }
        }
    }
    
    func fetchWeather() {
        isLoading = true
        Task {
            do {
                let weatherForecast = try await NetworkManager.shared.fetchWeatherForecasts()
                
                DispatchQueue.main.async {
                    self.weatherForcast = weatherForecast
                    self.isLoading = false
                }
            } catch {
                handleWeatherError(error)
            }
        }
    }

    func handleWeatherError(_ error: Error) {
        DispatchQueue.main.async {
            if let wError = error as? WError {
                switch wError {
                case .invalidURL:
                    self.alertItem = AlertContext.invalidURL
                case .invalidResponse:
                    self.alertItem = AlertContext.invalidResponse
                case .invalidData:
                    self.alertItem = AlertContext.invalidData
                case .unableToComplete:
                    self.alertItem = AlertContext.unableToComplete
                }
            }
            self.isLoading = false
        }
    }
    
}
