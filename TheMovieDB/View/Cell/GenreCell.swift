//
//  GenreCell.swift
//  TheMovieDB
//
//  Created by user on 17.01.2024.
//

import SwiftUI

struct GenreCell: View {
    
    var imageText: String
    var imageName: String
    
    var body: some View {
        
        ZStack {
            Image(imageName)
                .resizable()
            
            RoundedRectangle(cornerRadius: 16)
                .opacity(0.5)
                
            Text(imageText)
                .font(.title2)
                .fontWeight(.light)
                .foregroundStyle(.white)
            
            
        }.frame(width: 200, height: 120)
            .clipShape((RoundedRectangle(cornerRadius: 16.0)))
            .padding(.leading, 16)
        
    }
}

#Preview {
    GenreCell(imageText: "Action" ,imageName: "action")
}
