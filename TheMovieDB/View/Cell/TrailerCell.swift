//
//  TrailerCell.swift
//  TheMovieDB
//
//  Created by user on 14.01.2024.
//

import SwiftUI

struct TrailerCell: View {
    
    //var trailerKey: Trailer
    
    var body: some View {
        Text("x")
       /*
        ZStack {
            AsyncImage(url: URL(string: "\(APIManager.API_IMAGEPATH_ENDPOINT)\(trailer ?? "")")) { item in
                
                item.resizable()
                    .frame(width: 160, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color.black.opacity(0.5), radius: 12)
                    .frame(width: geometry.size.width * 0.35, height: 200)
            } placeholder: {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 160, height: 100)
                    .foregroundStyle(.gray.opacity(0.1))
            }.padding(.leading)
            
            
               
        }
        */
    }
}

#Preview {
    TrailerCell()
}
