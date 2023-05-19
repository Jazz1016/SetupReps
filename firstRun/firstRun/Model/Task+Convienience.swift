//
//  Task+Convienience.swift
//  firstRun
//
//  Created by James Lea on 5/19/23.
//

import Foundation
import CoreData

extension Task {
    @discardableResult convenience init(id: UUID, title: String, isCompleted: Bool, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}

extension Task {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.title == rhs.title && lhs.description == rhs.description && lhs.id == rhs.id
    }
}
