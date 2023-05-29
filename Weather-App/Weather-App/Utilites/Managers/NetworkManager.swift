//
//  NetworkManager.swift
//  Weather-App
//
//  Created by James Lea on 5/27/23.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "api.openweathermap.org/data/2.5/forecast"
    
    static let apiKey = Keys.apiKey
    
    func fetchWeatherForecasts() async throws ->  {
        
    }
    
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
