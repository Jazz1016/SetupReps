//
//  MockData.swift
//  Weather-App
//
//  Created by James Lea on 5/27/23.
//

import Foundation

struct MockData {
    
    static let mockWeatherResponse1 = WeatherResponse(
        dt: 1685134800,
        main: Main(
            temp: 289.39,
            feelsLike: 288.38,
            tempMin: 287.85,
            tempMax: 289.39,
            pressure: 1010,
            seaLevel: 1010,
            grndLevel: 880,
            humidity: 50,
            tempKf: 1.54
        ),
        weather: [
            Weather(
                id: 804,
                main: "Clouds",
                description: "overcast clouds",
                icon: "04n"
            )
        ],
        clouds: Clouds(all: 100),
        wind: Wind(speed: 4.55, deg: 209, gust: 5.71),
        visibility: 10000,
        pop: 0.2,
        sys: Sys(pod: "n"),
        dtTxt: "2023-05-26 21:00:00"
    )

    static let mockWeatherResponse2 = WeatherResponse(
        dt: 1685134801,
        main: Main(
            temp: 291.12,
            feelsLike: 289.98,
            tempMin: 290.02,
            tempMax: 291.12,
            pressure: 1012,
            seaLevel: 1012,
            grndLevel: 882,
            humidity: 52,
            tempKf: 1.10
        ),
        weather: [
            Weather(
                id: 800,
                main: "Clear",
                description: "clear sky",
                icon: "01d"
            )
        ],
        clouds: Clouds(all: 0),
        wind: Wind(speed: 5.12, deg: 195, gust: 6.24),
        visibility: 10000,
        pop: 0.0,
        sys: Sys(pod: "d"),
        dtTxt: "2023-05-27 09:00:00"
    )

    static let mockWeatherResponse3 = WeatherResponse(
        dt: 1685134802,
        main: Main(
            temp: 285.79,
            feelsLike: 283.42,
            tempMin: 283.79,
            tempMax: 285.79,
            pressure: 1008,
            seaLevel: 1008,
            grndLevel: 878,
            humidity: 56,
            tempKf: 2.00
        ),
        weather: [
            Weather(
                id: 500,
                main: "Rain",
                description: "light rain",
                icon: "10d"
            )
        ],
        clouds: Clouds(all: 85),
        wind: Wind(speed: 3.67, deg: 180, gust: 4.98),
        visibility: 10000,
        pop: 0.15,
        sys: Sys(pod: "d"),
        dtTxt: "2023-05-27 15:00:00"
    )

    static let WeatherArray = [mockWeatherResponse1, mockWeatherResponse2, mockWeatherResponse3]
}
