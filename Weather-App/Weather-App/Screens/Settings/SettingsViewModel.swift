//
//  SettingsViewModel.swift
//  Weather-App
//
//  Created by James Lea on 5/30/23.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    @AppStorage("userCity") private var userCity: Data?
    @Published var selectedCity: City = City(id: 1, name: "New York")
    
    func saveCity() {
            do {
                let data = try JSONEncoder().encode(selectedCity)
                userCity = data
            } catch {
                print(error)
            }
        }
        
        func retrieveCity() {
            guard let userCity = userCity else { return }
            
            do {
                let decodedCity = try JSONDecoder().decode(City.self, from: userCity)
                selectedCity = decodedCity
            } catch {
                print(error)
            }
        }
    
}
