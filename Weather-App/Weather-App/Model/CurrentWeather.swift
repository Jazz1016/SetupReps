//
//  CurrentWeather.swift
//  Weather-App
//
//  Created by James Lea on 5/29/23.
//

import Foundation

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct CurrentWeatherData: Codable {
    var imageURL: String?
    let weather: [Weather]
    let main: CurrentMain
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: TimeInterval
//    let sys: CurrentSys
    let timezone: Int
    let id: Int
    let name: String
//    let cod: Int
}

struct CurrentMain: Codable {
    let temp: Double
    let humidity: Int
}

struct CurrentSys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: TimeInterval
    let sunset: TimeInterval
}
