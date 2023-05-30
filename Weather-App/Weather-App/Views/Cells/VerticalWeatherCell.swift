//
//  VerticalWeatherCell.swift
//  Weather-App
//
//  Created by James Lea on 5/30/23.
//

import SwiftUI

struct VerticalWeatherCell: View {
    let forecast: WeatherData
    
    var body: some View {
        VStack {
            let dateStr = Helpers.formatTimeIntervalToString(from: forecast.dt)
            
            let tempFahrenheit = Helpers.kelvinToFahrenheit(forecast.main.temp)
            
            let windSpeed = Helpers.metersPerSecondToMilesPerHour(forecast.wind.speed)
            
            Text("\(dateStr)")
                .font(.title)
                .fontWeight(.bold)
            
            WeatherRemoteImage(urlString: forecast.imageURL ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text("\(forecast.weather[0].description)")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Text("\(Int(tempFahrenheit))° F")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Humidity: \(forecast.main.humidity)")
                .font(.title3)
            
            Text("Wind Speed: \(windSpeed, specifier: "%.1f") MPH")
                .font(.title3)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct VerticalWeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        VerticalWeatherCell(forecast: MockData.weatherData1)
    }
}
