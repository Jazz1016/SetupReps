//
//  OnboardingView.swift
//  Weather-App
//
//  Created by James Lea on 5/31/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("userCity") private var userCity: Data?
    @State var selectedCity = City(id: 0, name: "Cupertino")
    @State var pickerCity: City = City(id: 1, name: "New York")
    
    var body: some View {
        ZStack {
            VStack {
                Text("Please Select a City")
                Picker("Select a city", selection: $pickerCity) {
                    ForEach(Cities.list, id: \.id) { city in
                        Text(city.name).tag(city)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .onChange(of: pickerCity) { newCity in
                    print("Selected city: \(pickerCity)")
                }
                
                Button {
                    selectedCity = pickerCity
                    saveCity()
                } label: {
                    Text("Confirm")
                }
            }
            .onAppear {
                retrieveCity()
            }
            
            if selectedCity.id != 0 {
                WeatherHomeView()
            }
        }
    }
    
    func saveCity() {
        guard selectedCity.id != 0 else { return }
        
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

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
