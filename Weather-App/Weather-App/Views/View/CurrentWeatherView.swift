//
//  CurrentWeatherView.swift
//  Weather-App
//
//  Created by James Lea on 5/30/23.
//

import SwiftUI

struct CurrentWeatherView: View {
    let weather: CurrentWeatherData
    
    var body: some View {
        VStack {
            let dateStr = Helpers.formatCurrentTimeIntervalToString(from: weather.dt)
            
            let tempFahrenheit = Helpers.kelvinToFahrenheit(weather.main.temp)
            
            let windSpeed = Helpers.metersPerSecondToMilesPerHour(weather.wind.speed)
            
            Text(dateStr)
                .font(.title)
            
            HStack(alignment: .top) {
                VStack() {
                    Text("Temperature: \(Int(tempFahrenheit))°F")
                        .padding()
                        .font(.headline)
                    
                    Text("Wind Speed: \(windSpeed, specifier: "%.1f") MPH")
                        .padding(.top)
                        .font(.subheadline)
                    
                    Text("Humidity: \(weather.main.humidity)%")
                        .padding(.top)
                        .font(.subheadline)
                }
                .frame(height: 200)
                
                VStack {
                    WeatherRemoteImage(urlString: weather.imageURL ?? "")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                    Text(weather.weather[0].description)
                        .font(.subheadline)
                }
                .frame(height: 200)
            }
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(weather: MockData.mockCurrentWeatherData)
    }
}
