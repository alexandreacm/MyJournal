//
//  CreateJournalEntryView.swift
//  SwiftUI_My_Journal
//
//  Created by Alexandre Marques on 07/02/24.
//

import SwiftUI
import SwiftData

struct CreateJournalEntryView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var isEditing: Bool = false
    
    @State var title: String = ""
    @State var text: String = "Today was ..."
    @State var rating: Double = 2.0
    @State var date: Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                DatePicker("Data",selection: $date, displayedComponents: [.date])
                Text(String(repeating: "⭐️", count: Int(rating)))
                Slider(value: $rating, in: 1...5, step: 1, onEditingChanged: { editing in
                    isEditing = editing
                })
                
                TextEditor(text: $text)
            }
            .navigationTitle("New Journal Entry")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", action: { dismiss()})
                }
                
                ToolbarItem {
                    Button("Save", action: addJournal)
                }
            }
        }
    }
    
    func addJournal() {
        let newJournal = JournalEntry(title: title, text: text, rating: rating, date: date)
        
        modelContext.insert(newJournal)
        dismiss()
    }
}

#Preview {
    CreateJournalEntryView()
}
