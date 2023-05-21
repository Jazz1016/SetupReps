//
//  Quote+Convienience.swift
//  Kanye-Quotes
//
//  Created by James Lea on 5/20/23.
//

import Foundation
import CoreData

extension Quote {
    @discardableResult convenience init(id: UUID, text: String, isFavorite: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.id = id
        self.text = text
        self.isFavorite = isFavorite
    }
}

extension Quote {
    static func == (lhs: Quote, rhs: Quote) -> Bool {
        return lhs.id == rhs.id
    }
}
