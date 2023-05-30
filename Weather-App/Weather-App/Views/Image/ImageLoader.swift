//
//  ImageLoader.swift
//  Weather-App
//
//  Created by James Lea on 5/29/23.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(from urlString: String) {
        NetworkManager.shared.downloadImage(from: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("weather-placeholder").resizable()
    }
}

struct WeatherRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(from: urlString)
            }
    }
}
