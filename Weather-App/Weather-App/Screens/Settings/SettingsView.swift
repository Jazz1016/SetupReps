//
//  SettingsView.swift
//  Weather-App
//
//  Created by James Lea on 5/30/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    @Binding var isShowingSettings: Bool
    
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Form {
                    Picker("Select a city", selection: $viewModel.selectedCity) {
                        ForEach(Cities.list) { city in
                            Text(city.name).tag(city)
                        }
                    }
                    Button {
                        viewModel.saveCity()

                    } label: {
                        Text("Save Changes")
                    }
                }
                Spacer()
            }
            .navigationTitle("🤖 Settings")
            .onAppear {
                viewModel.retrieveCity()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            isShowingSettings = false
                        }) {
                            Text("< Back")
                        }
                    }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isShowingSettings: .constant(true))
    }
}
