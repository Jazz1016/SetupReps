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
                    let text = quote.text ?? ""
                    Text("\(text)")
                        .onTapGesture {
                            viewModel.selectedQuote = quote
                        }
                        .swipeActions(edge: .trailing) {
                            Button(action: {
                                viewModel.deleteQuote(quote: quote)
                            }) {
                                Text("Delete")
                            }
                            .tint(.red)
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
                QuoteDetailView(isShowDetailView: $viewModel.isShowDetailView, quote: $viewModel.selectedQuote, isFavoriteChanged: viewModel.selectedQuote!.isFavorite)
            }
            
        }
        .onAppear {
            viewModel.fetchQuotes()
        }
    }
}

struct QuotesListView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesListView()
    }
}
