
/*
 SwiftUI is a declarative framework for constructing user interfaces (UI) for iOS Apps
 */

import SwiftUI
import SwiftData

struct JournalListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort:\JournalEntry.date, order: .reverse) private var journalEntries: [JournalEntry]
    
    @State var showCreateView: Bool = false
    @State var searchJournal = ""
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach(searchJornalEntries) { listJournal in
                        NavigationLink(destination: EditJournalEntryView(editingJournalEntry: listJournal)) {
                            JournalEntryRowView(journalEntry: listJournal)
                        }
                        
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            showCreateView = true
                        }) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                .navigationTitle("\(journalEntries.count) Journals Entries")
                .sheet(isPresented: $showCreateView) {
                    CreateJournalEntryView()
                }
            }
            .searchable(text: $searchJournal)
        }
    }
    
    var searchJornalEntries: [JournalEntry] {
        if searchJournal.count > 0 {
            return journalEntries.filter { $0.title.localizedCaseInsensitiveContains(searchJournal) }
        } else {
            return journalEntries
        }
    }
}

#Preview {
    JournalListView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
