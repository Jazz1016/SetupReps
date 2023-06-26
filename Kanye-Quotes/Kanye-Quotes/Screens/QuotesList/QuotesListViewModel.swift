//
//  QuotesListViewModel.swift
//  Kanye-Quotes
//
//  Created by James Lea on 5/20/23.
//

import Foundation
import CoreData

class QuotesListViewModel: ObservableObject {
    
    @Published var selectedQuote: Quote? {
        didSet {
            isShowDetailView = true
        }
    }
    @Published var quotes: [Quote] = []
    @Published var isShowDetailView: Bool = false
    
    lazy var fetchRequest: NSFetchRequest<Quote> = {
         let request = NSFetchRequest<Quote>(entityName: "Quote")
         request.predicate = NSPredicate(value: true)
         return request
        }()
    
    func fetchQuotes() {
        quotes = []
        let fetchedQuotes = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        for quote in fetchedQuotes {
            quote.isFavorite ? quotes.insert(quote, at: 0) : quotes.append(quote)
        }
    }
    
    func createQuote() {
        let id = UUID()
        let randomNum = Int.random(in: 0...126)
        print(kanyeQuotes.count)
        let yeQuote = kanyeQuotes[randomNum]
        let quote = Quote(id: id, text: yeQuote, isFavorite: false)
        quotes.append(quote)
        CoreDataStack.saveContext()
    }
    
    func favoriteQuote(quote: Quote, isFavorite: Bool) {
        quote.isFavorite = isFavorite
        CoreDataStack.saveContext()
        fetchQuotes()
    }
    
    func deleteQuote(quote: Quote) {
        let index = quotes.firstIndex(of: quote)!
        quotes.remove(at: index)
        CoreDataStack.context.delete(quote)
        CoreDataStack.saveContext()
    }
    
}
