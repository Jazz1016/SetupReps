//
//  SettingsViewModel.swift
//  Weather-App
//
//  Created by James Lea on 5/30/23.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    @AppStorage("city") private var cityData: Data?
    @Published var selectedCity = City(id: 0, name: "Cupertino")
    
    
}
