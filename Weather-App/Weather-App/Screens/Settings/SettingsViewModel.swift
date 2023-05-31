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
    
    func saveChanges(city: City) {
        
        do {
            let data = try JSONEncoder().encode(city)
            userData = data
            alertItem = AlertContext.userSaveSuccess
            return
        } catch {
            alertItem = AlertContext.invalidUserData
            return
        }
    }
    
}
