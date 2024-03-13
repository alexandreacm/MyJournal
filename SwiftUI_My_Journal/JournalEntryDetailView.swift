//
//  JournalEntryDetailView.swift
//  SwiftUI_My_Journal
//
//  Created by Alexandre Marques on 11/01/24.
//

import SwiftUI

struct JournalEntryDetailView: View {
    let detailJournalEntry: JournalEntry
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(detailJournalEntry.date, style: .date)
                        .bold()
                    Text("-")
                    Text(String(repeating: "⭐️", count: Int(detailJournalEntry.rating)))
                    Spacer()
                }
                .padding(.bottom)
                
                Text(detailJournalEntry.text)
            }
            .padding()
        }
        .navigationTitle(detailJournalEntry.title)
    }
}

#Preview {
    NavigationStack {
        JournalEntryDetailView(detailJournalEntry:  JournalEntry(title:"Lorem ipsum", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate leo et erat ullamcorper, at ultrices mi molestie. Morbi consectetur aliquam semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam quis diam at dui ultricies finibus. Vestibulum eleifend leo in orci aliquet, quis scelerisque lacus laoreet. Lorem ipsum dolor sit amet, consectetur.", rating: 6, date: Date()))
    }
}
