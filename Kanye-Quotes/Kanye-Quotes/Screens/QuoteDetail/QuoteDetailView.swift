//
//  QuoteDetailView.swift
//  Kanye-Quotes
//
//  Created by James Lea on 5/21/23.
//

import SwiftUI

struct QuoteDetailView: View {
    
    @Binding var isShowDetailView: Bool
    @Binding var quote: Quote?
    @State var isFavoriteChanged: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.isShowDetailView = false
                } label: {
                    Text("Back")
                        .foregroundColor(.blue)
                        .frame(height: 40)
                }
                
                Spacer()
                
                Button {
                    quote?.isFavorite = true
                    isFavoriteChanged.toggle()
                } label: {
                    Image(systemName: isFavoriteChanged ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            
            Text(quote?.text ?? "")
                .font(.body)
                .foregroundColor(.black)
                .padding()
            
            Text(" -Kanye West")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .font(.title3)
            
            Spacer()
        }
        .padding()
    }
}
