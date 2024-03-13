//
//  JournalEntryRowView.swift
//  SwiftUI_My_Journal
//
//  Created by Alexandre Marques on 06/02/24.
//

import SwiftUI

struct JournalEntryRowView: View {
    
    let journalEntry: JournalEntry
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 3) {
            Text(journalEntry.title)
                .foregroundColor(.primary)
                .font(.headline)
            
            Text(journalEntry.text)
                .foregroundColor(.secondary)
                .font(.subheadline)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(.top, 2)
            
            HStack {
                Text(journalEntry.date, style: .date)
                    .foregroundColor(.secondary)
                    .font(.subheadline)

                Text(String(repeating: "⭐️", count: Int(journalEntry.rating)))
            }
            .padding(.top, 5)
        }
        
    }
}

#Preview {
    JournalEntryRowView(journalEntry: JournalEntry(title:"Lorem ipsum", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate leo et erat ullamcorper, at ultrices mi molestie. Morbi consectetur aliquam semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam quis diam at dui ultricies finibus. Vestibulum eleifend leo in orci aliquet, quis scelerisque lacus laoreet. Lorem.", rating: 6, date: Date()))
}
