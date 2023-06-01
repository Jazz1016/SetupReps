//
//  NetworkManager.swift
//  Weather-App
//
//  Created by James Lea on 5/27/23.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    static let baseURL = "https://api.openweathermap.org/data/2.5/forecast"
    static let apiKey = Keys.apiKey
    
    func fetchWeatherForecasts(city: String) async throws -> [WeatherData] {
        guard let url =  URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(Keys.apiKey)")
        else {
            throw WError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
            let weatherData = decodedData.list
            let filteredWeatherData = filterForNoonWeatherData(weatherData)
            let finalWeatherData = filteredWeatherData.map { weatherData in
                let randomInt = Int.random(in: 1..<100000000)
                var mockWeatherData = weatherData
                let imageURL = "https://openweathermap.org/img/wn/\(weatherData.weather[0].icon)@2x.png"
                mockWeatherData.id = "\(randomInt)"
                mockWeatherData.imageURL = imageURL
                return mockWeatherData
            }
            return finalWeatherData
        } catch {
            throw WError.invalidData
        }
    }
    
    func fetchCurrentWeatherCondition(city: String) async throws -> CurrentWeatherData {
        guard let url =  URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(Keys.apiKey)")
        else {
            throw WError.invalidURL
        }
        
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decodedData = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
            var tempWeather = decodedData
            let imageURL = "https://openweathermap.org/img/wn/\(tempWeather.weather[0].icon)@2x.png"
            tempWeather.imageURL = imageURL
            return tempWeather
        } catch {
            throw WError.invalidData
        }
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
    
    func filterForNoonWeatherData(_ weatherData: [WeatherData]) -> [WeatherData] {
        let calendar = Calendar.current
        let noonWeatherData = weatherData.filter { data in
            let date = Date(timeIntervalSince1970: TimeInterval(data.dt))
            let noonComponents = DateComponents(hour: 12, minute: 0)
            let noonDate = calendar.date(bySettingHour: 12, minute: 0, second: 0, of: date)
            let noonDateInTimeZone = calendar.date(bySettingHour: noonComponents.hour!, minute: noonComponents.minute!, second: 0, of: noonDate!)
            return calendar.component(.hour, from: date) == 12
        }
        return noonWeatherData
    }
    
}
