//
//  MockData.swift
//  Weather-App
//
//  Created by James Lea on 5/27/23.
//

import Foundation

struct MockData {
    
    static let weatherData1 = WeatherData(id: "1", imageURL: nil, dt: 1622088000, main: MainData(temp: 25.5, humidity: 80), weather: [Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")], clouds: Clouds(all: 0), wind: Wind(speed: 3.5), visibility: 10000, pop: 0.0, sys: Sys(pod: "d"), dt_txt: "2021-05-27 12:00:00")

    static let weatherData2 = WeatherData(id: "2", imageURL: nil, dt: 1622098800, main: MainData(temp: 24.8, humidity: 75), weather: [Weather(id: 801, main: "Clouds", description: "few clouds", icon: "02d")], clouds: Clouds(all: 20), wind: Wind(speed: 4.2), visibility: 10000, pop: 0.0, sys: Sys(pod: "d"), dt_txt: "2021-05-27 15:00:00")

    static let weatherData3 = WeatherData(id: "3", imageURL: nil, dt: 1622109600, main: MainData(temp: 23.2, humidity: 65), weather: [Weather(id: 500, main: "Rain", description: "light rain", icon: "10d")], clouds: Clouds(all: 80), wind: Wind(speed: 5.3), visibility: 9000, pop: 0.15, sys: Sys(pod: "d"), dt_txt: "2021-05-27 18:00:00")

    static let weatherData4 = WeatherData(id: "4", imageURL: nil, dt: 1622120400, main: MainData(temp: 22.1, humidity: 70), weather: [Weather(id: 803, main: "Clouds", description: "broken clouds", icon: "04d")], clouds: Clouds(all: 65), wind: Wind(speed: 6.1), visibility: 8000, pop: 0.0, sys: Sys(pod: "d"), dt_txt: "2021-05-27 21:00:00")

    static let weatherData5 = WeatherData(id: "5", imageURL: nil, dt: 1622131200, main: MainData(temp: 21.3, humidity: 75), weather: [Weather(id: 801, main: "Clouds", description: "few clouds", icon: "02n")], clouds: Clouds(all: 25), wind: Wind(speed: 5.8), visibility: 7000, pop: 0.0, sys: Sys(pod: "n"), dt_txt: "2021-05-28 00:00:00")

    static var mockData: [WeatherData] = [weatherData1, weatherData2, weatherData3, weatherData4, weatherData5]

    static let mockCurrentWeatherData: CurrentWeatherData = CurrentWeatherData(
        imageURL: "https://example.com/image.jpg",
        weather: [
            Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")
        ],
        main: CurrentMain(temp: 20.5, humidity: 70),
        visibility: 10000,
        wind: Wind(speed: 5.4),
        clouds: Clouds(all: 0),
        dt: 1654960800,
        timezone: -14400,
        id: 123456,
        name: "New York"
    )

}
