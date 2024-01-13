//
//  ImagePoster.swift
//  TheMovieDB
//
//  Created by user on 14.01.2024.
//

import SwiftUI

struct ImagePoster: View {
    
    @State var imagePath: String
    
    var body: some View {
        
        ZStack (alignment: .topTrailing){
            AsyncImage(url: URL(string: "\(APIManager.API_IMAGEPATH_ENDPOINT)\(imagePath)")) { item in
                
                item.resizable()
                    .frame(width: 100, height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(color: Color.black.opacity(0.5), radius: 12)
                
            } placeholder: {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 100, height: 160)
                    .foregroundStyle(.gray.opacity(0.1))
            }
            .padding(.bottom, 8)
        
            
        }
    }
}

#Preview {
    ImagePoster(imagePath: "")
}
