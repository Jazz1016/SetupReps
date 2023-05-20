//
//  Kanye_QuotesApp.swift
//  Kanye-Quotes
//
//  Created by James Lea on 5/20/23.
//

import SwiftUI

@main
struct Kanye_QuotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
