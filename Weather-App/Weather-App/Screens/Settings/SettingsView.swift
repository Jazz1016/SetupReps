//
//  SettingsView.swift
//  Weather-App
//
//  Created by James Lea on 5/30/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select a city", selection: $viewModel.selectedCity) {
                    ForEach(Cities.list) { city in
                        Text(city.name).tag(city)
                    }
                }
            }
            .navigationTitle("🤖 Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
