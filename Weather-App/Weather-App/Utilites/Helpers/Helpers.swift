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
        dateFormatter.dateFormat = "EEE \n MMM d"
        
        return dateFormatter.string(from: date)
    }
}
