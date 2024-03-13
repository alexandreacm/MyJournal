//
//  EditJournalEntryView.swift
//  SwiftUI_My_Journal
//
//  Created by Alexandre Marques on 08/02/24.
//

import SwiftUI

struct EditJournalEntryView: View {
    @State var editingJournalEntry: JournalEntry
    @State var editMode: Bool = false
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
 
    var body: some View {
        if(editMode) {
            
            Form {
                TextField("Title", text: $editingJournalEntry.title)
                DatePicker("Data", selection: $editingJournalEntry.date, displayedComponents: .date)
                Text(String(repeating: "⭐️", count: Int(editingJournalEntry.rating)))
                Slider(value: $editingJournalEntry.rating, in: 1...5, step: 1)
                TextEditor(text: $editingJournalEntry.text)
                    .frame(height: CGFloat(editingJournalEntry.text.count + 40))
            }
            .navigationTitle("Edit Mode")
            .toolbar {
                ToolbarItem {
                    Button("Delete") {
                        modelContext.delete(editingJournalEntry)
                        dismiss()
                    }
                    .foregroundStyle(.red)
                    .bold()
                }
                ToolbarItem {
                    Button("Done") {
                        editMode = false
                        modelContext.insert(editingJournalEntry)
                        dismiss()
                    }
                    .bold()
                }
            }
            
        } else {
            JournalEntryDetailView(detailJournalEntry: editingJournalEntry)
                .toolbar {
                    Button("Edit", action: {editMode = true})
                }
        }
    }
}

#Preview {
    NavigationStack {
        EditJournalEntryView(editingJournalEntry: JournalEntry(title: "Headache", text: loremIpsumText, rating: 4, date: Date()))
    }
}
