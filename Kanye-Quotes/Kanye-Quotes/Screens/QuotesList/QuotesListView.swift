//
//  QuotesListView.swift
//  Kanye-Quotes
//
//  Created by James Lea on 5/20/23.
//

import SwiftUI

struct QuotesListView: View {
    
    @StateObject private var viewModel = QuotesListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.quotes) { quote in
                    QuoteListCell(quote: quote) {
                        viewModel.deleteQuote(quote: quote)
                    }
                    .onTapGesture {
                        viewModel.selectedQuote = quote
                    }
                }
            }
            .navigationTitle("Kanye Quotes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.createQuote()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.isShowDetailView) {
                QuoteDetailView(isShowDetailView: $viewModel.isShowDetailView, quote: $viewModel.selectedQuote, isFavoriteChanged: viewModel.selectedQuote!.isFavorite, onFavorite: viewModel.favoriteQuote )
            }
            
        }
        .onAppear {
            viewModel.fetchQuotes()
        }
    }
    
    func didSelectQuote(_ quote: Quote) {
            viewModel.selectedQuote = quote // Update the selected quote in the view model
        }
}

struct QuotesListView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesListView()
    }
}
