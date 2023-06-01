//
//  CityPicker.swift
//  Weather-App
//
//  Created by James Lea on 5/31/23.
//

import SwiftUI

struct CityPicker: View {
    @State var selectedCity: City
    
    var body: some View {
        Picker("Select a city", selection: $selectedCity) {
            ForEach(Cities.list) { city in
                Text(city.name).tag(city)
            }
        }
    }
}

struct CityPicker_Previews: PreviewProvider {
    static var previews: some View {
        CityPicker(selectedCity: Cities.list[0])
    }
}
