//
//  CustomImageView.swift
//  SwiftUI_My_Journal
//
//  Created by Alexandre Marques on 04/01/24.
//

import SwiftUI

struct CustomImageView: View {
    
    var iconFill = false
    
    var body: some View {
        
        Image(systemName: !iconFill ? "star": "star.fill")
            .font(.system(size: 30))
            .foregroundColor(.yellow)
    }
}

#Preview {
    CustomImageView(iconFill: true)
}
