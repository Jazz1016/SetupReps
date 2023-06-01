//
//  WeatherHomeViewModel.swift
//  Weather-App
//
//  Created by James Lea on 5/29/23.
//

import SwiftUI

final class WeatherHomeViewModel: ObservableObject {
    @AppStorage("userCity") private var userCity: Data?
    @Published var selectedCity: City?
    @Published var weatherForcast: [WeatherData] = []
    @Published var currentWeather: CurrentWeatherData? = nil
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingSettings = false
    @Published var city: City?
    
    func retrieveCity(completion: @escaping (Result<City, WError>) -> Void) {
        guard let userCity = userCity else { return }
        
        do {
            let decodedCity = try JSONDecoder().decode(City.self, from: userCity)
            selectedCity = decodedCity
            completion(.success(decodedCity))
        } catch {
            completion(.failure(error as! WError))
        }
    }
    
    func fetchInOrder() {
        isLoading = true
        retrieveCity() { result in
            switch result {
            case .success(let city):
                self.selectedCity = city
                self.fetchCurrentWeather()
                self.fetchWeather()
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }
    
    func fetchCurrentWeather() {
        guard let selectedCity else { return }
        Task {
            do {
                let currentWeather = try await NetworkManager.shared.fetchCurrentWeatherCondition(city: selectedCity.name)
                
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
        guard let selectedCity else { return }
        Task {
            do {
                let weatherForecast = try await NetworkManager.shared.fetchWeatherForecasts(city: selectedCity.name)
                
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
