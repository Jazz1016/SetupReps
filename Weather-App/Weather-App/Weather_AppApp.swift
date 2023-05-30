//
//  Weather_AppApp.swift
//  Weather-App
//
//  Created by James Lea on 5/26/23.
//

import SwiftUI

@main
struct Weather_AppApp: App {
    var selectedCity = SelectedCity()
    
    var body: some Scene {
        WindowGroup {
            WeatherHomeView()
                .environmentObject(selectedCity)
        }
    }
}
