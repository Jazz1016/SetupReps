//
//  Helpers.swift
//  Weather-App
//
//  Created by James Lea on 5/29/23.
//

import Foundation

class Helpers {
    static func formatTimeIntervalToString(from timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMM d"
        
        return dateFormatter.string(from: date)
    }
    
    static func formatCurrentTimeIntervalToString(from timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        
        return dateFormatter.string(from: date)
    }
    
    static func kelvinToFahrenheit(_ temperature: Double) -> Double {
        let fahrenheit = (temperature - 273.15) * 9/5 + 32
        return fahrenheit
    }
    
    static func metersPerSecondToMilesPerHour(_ metersPerSecond: Double) -> Double {
        let metersInOneMile: Double = 1609.34
        let secondsInOneHour: Double = 3600
        
        let miles = metersPerSecond * secondsInOneHour / metersInOneMile
        
        return miles
    }
    
}
