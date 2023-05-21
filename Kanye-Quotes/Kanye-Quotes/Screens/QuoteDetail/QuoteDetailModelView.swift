//
//  QuoteDetailModelView.swift
//  Kanye-Quotes
//
//  Created by James Lea on 5/21/23.
//

import SwiftUI

class QuoteDetailViewModel: ObservableObject {
    @Binding var isShowDetailView: Bool
    @Binding var quote: Quote?
    @Published var isFavoriteChanged: Bool

    init(isShowDetailView: Binding<Bool>, quote: Binding<Quote?>, isFavoriteChanged: Bool) {
        _isShowDetailView = isShowDetailView
        _quote = quote
        self.isFavoriteChanged = isFavoriteChanged
    }
    
    func toggleFavorite() {
        quote?.isFavorite = true
        isFavoriteChanged.toggle()
    }
}
