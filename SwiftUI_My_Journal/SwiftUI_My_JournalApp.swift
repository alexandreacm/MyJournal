//
//  SwiftUI_My_JournalApp.swift
//  SwiftUI_My_Journal
//
//  Created by Alexandre Marques on 30/12/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_My_JournalApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            JournalEntry.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            JournalListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
