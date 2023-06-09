//
//  WeatherResponse.swift
//  Weather-App
//
//  Created by James Lea on 5/26/23.
//

import Foundation

struct WeatherResponse: Codable {
    let list: [WeatherData]
}

struct WeatherData: Codable, Identifiable {
    var id: String?
    var imageURL: String?
    let dt: TimeInterval
    let main: MainData
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dt_txt: String
}

struct MainData: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Clouds: Codable {
    let all: Int
}

struct Wind: Codable {
    let speed: Double
}

struct Sys: Codable {
    let pod: String
}
