//
//  QuoteDetailView.swift
//  Kanye-Quotes
//
//  Created by James Lea on 5/21/23.
//

import SwiftUI

struct QuoteDetailView: View {
    @StateObject private var viewModel: QuoteDetailViewModel
    let onFavorite: (Quote, Bool) -> ()
    
    init(isShowDetailView: Binding<Bool>, quote: Binding<Quote?>, isFavoriteChanged: Bool, onFavorite: @escaping (Quote, Bool) -> ()) {
        _viewModel = StateObject(wrappedValue: QuoteDetailViewModel(isShowDetailView: isShowDetailView, quote: quote, isFavoriteChanged: isFavoriteChanged))
        self.onFavorite = onFavorite
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    viewModel.isShowDetailView = false
                } label: {
                    Text("Back")
                        .foregroundColor(.blue)
                        .frame(height: 40)
                }
                
                Spacer()
                
                Button {
                    viewModel.toggleFavorite()
                    onFavorite(viewModel.quote!, viewModel.isFavoriteChanged)
                } label: {
                    Image(systemName: viewModel.isFavoriteChanged ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            
            VStack {
                Text(viewModel.quote?.text ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding()
                
                HStack {
                    Spacer()
                    Text("- Kanye West")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
            }
            
            Spacer()
        }
        .padding()
    }
}
