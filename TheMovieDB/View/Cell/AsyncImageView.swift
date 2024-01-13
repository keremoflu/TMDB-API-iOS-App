//
//  AsyncImageView.swift
//  TheMovieDB
//
//  Created by user on 15.01.2024.
//

import SwiftUI

struct AsyncImageView: View {
    
    var imagePath: String
    var imageWidth: Int
    var imageHeight: Int
    
    var body: some View {
        AsyncImage(url: URL(string: "\(APIManager.API_IMAGEPATH_ENDPOINT)\(imagePath)")) { item in
            
            item.resizable()
                .frame(width: 300, height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .shadow(color: Color.black.opacity(0.5), radius: 12)
            
        } placeholder: {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 300, height: 400)
                .foregroundStyle(.blue.opacity(0.1))
        }
    }
}

#Preview {
    AsyncImageView(imagePath: "", imageWidth: 100, imageHeight: 200)
}
