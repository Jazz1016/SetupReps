//
//  ContentView.swift
//  Weather-App
//
//  Created by James Lea on 5/26/23.
//

import SwiftUI

struct WeatherHomeView: View {
    
    @StateObject var viewModel = WeatherHomeViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    if let weather = viewModel.currentWeather {
                        CurrentWeatherView(weather: weather)
                    } else {
                        LoadingView()
                    }
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.weatherForcast) { forecast in
                                VerticalWeatherCell(forecast: forecast)
                            }
                            .padding()
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchCurrentWeather()
                    viewModel.fetchWeather()
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("😎 Weather Report")
                            .foregroundColor(.white) // Change the text color here
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                viewModel.isShowingSettings = true
                            }) {
                                Image(systemName: "gearshape")
                            }
                        }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.brandPrimary,for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .fullScreenCover(isPresented: $viewModel.isShowingSettings ) {
                            SettingsView()
                }
                if viewModel.isLoading {
                    LoadingView()
                }
            }
            .background(Color.black)
        }
        
    }
}
    
    struct WeatherHomeView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherHomeView()
        }
    }

