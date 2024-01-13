//
//  TrendingMovie.swift
//  TheMovieDB
//
//  Created by user on 13.01.2024.
//

import SwiftUI

struct TrendingMovie: View {
   
    @State var imagePath : String
    @State var rate: Double
    
    var body: some View {
        
       
            ZStack (alignment: .topTrailing){
                AsyncImage(url: URL(string: "\(APIManager.API_IMAGEPATH_ENDPOINT)\(imagePath)")) { item in
                    
                    item.resizable()
                        .frame(width: 240, height: 380)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .shadow(color: Color.black.opacity(0.5), radius: 12)
                    
                } placeholder: {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 240, height: 380)
                        .foregroundStyle(.gray.opacity(0.1))
                }
                
                HStack {
                    Text(String(format: "%.1f", rate))
                        .font(.body)
                       
                    Image(systemName: "star.fill")
                        .font(.caption)
                }
                .padding(6)
                .padding(.horizontal, 10)
                .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .foregroundStyle(.black)
                    
            
        }
        
        .padding(.vertical)
        .padding(.leading)
        .buttonStyle(ScaleButtonStyle())
    }
}

#Preview {
    TrendingMovie(imagePath: "", rate: 0.0)
}
