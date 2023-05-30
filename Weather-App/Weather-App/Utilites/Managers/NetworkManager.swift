//
//  NetworkManager.swift
//  Weather-App
//
//  Created by James Lea on 5/27/23.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://api.openweathermap.org/data/2.5/forecast"
    
    static let apiKey = Keys.apiKey
    
    func fetchWeatherForecasts() async throws -> [WeatherData] {
        guard let url =  URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Orem&appid=68f5cc68f53d8f2c381f41f100ab3b1b")
        else {
            
            
            throw WError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
//        print("Response Data:", data)
//        print("Response:", response)
        
        do {
            let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
//            print("decoded data: ", decodedData)
            let weatherData = decodedData.list
            var filteredWeatherData = filterForNoonWeatherData(weatherData)
            let finalWeawtherData = filteredWeatherData.map { weatherData in
                let randomInt = Int.random(in: 1..<100000000)
                var mockWeatherData = weatherData
                mockWeatherData.id = "\(randomInt)"
                return mockWeatherData
            }
            return finalWeawtherData
        } catch {
            throw WError.invalidData
        }
    }
//
//    func filterForNoonWeatherData(_ weatherData: [WeatherData]) -> [WeatherData] {
//        let calendar = Calendar.current
//
//        let noonWeatherData = weatherData.filter { data in
//            let date = Date(timeIntervalSince1970: data.dt)
//            let components = calendar.dateComponents([.hour, .minute], from: date)
//            return components.hour == 12 && components.minute == 0
//        }
//
//        return noonWeatherData
//    }
    
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




//    api.openweathermap.org/data/2.5/forecast?lat=40.2338&lon=111.6585&appid=68f5cc68f53d8f2c381f41f100ab3b1b
    
//    func getAppetizers() async throws -> [Appetizer] {
//        guard let url = URL(string: NetworkManager.appetizerURL) else {
//            throw APError.invalidURL
//        }
//
//        let (data, _) = try await URLSession.shared.data(from: url)
//            do {
//                return try JSONDecoder().decode(AppetizerResponse.self, from: data).request
//            } catch {
//                throw APError.invalidData
//        }
//    }
    
}
