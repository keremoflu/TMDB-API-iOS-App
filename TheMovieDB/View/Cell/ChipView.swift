//
//  ChipView.swift
//  TheMovieDB
//
//  Created by user on 14.01.2024.
//

import SwiftUI

struct ChipView: View {
    
    var chipName: String
    
    var body: some View {
        
        Text(chipName)
            .font(.callout)
            .fontWeight(.regular)
            .foregroundStyle(.white)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("backgroundChipView").opacity(0.3))
                .stroke(Color("backgroundChipView").opacity(0.2), lineWidth: 3)
            )
            .padding(.trailing, 6)
    }
}

#Preview {
    ChipView(chipName: "Adventure")
}
