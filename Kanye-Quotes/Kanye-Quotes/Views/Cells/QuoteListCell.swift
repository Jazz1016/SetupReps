//
//  QuoteListCell.swift
//  Kanye-Quotes
//
//  Created by James Lea on 5/21/23.
//

import SwiftUI

//protocol QuoteListCellDelegate: AnyObject {
//    func didSelectQuote(_ quote: Quote)
//}

struct QuoteListCell: View {
    let quote: Quote
    let onDelete: () -> Void
    
    var body: some View {
        
        HStack {
            let text = quote.text ?? ""
            Text("\(text)")
                .swipeActions(edge: .trailing) {
                    Button(action: onDelete) {
                        Text("Delete")
                    }
                    .tint(.red)
                }
            
            Spacer()
            if quote.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.pink)
            }
        }
    }
}

