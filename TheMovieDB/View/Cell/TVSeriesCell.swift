//
//  TVSeriesCell.swift
//  TheMovieDB
//
//  Created by user on 18.01.2024.
//

import SwiftUI

struct TVSeriesCell: View {
    
    var tvSeriesImage: String
    var tvSeriesName: String
    var tvSeriesDesc: String
    
    var body: some View {
        HStack {
            
            
            AsyncImage(url: URL(string: "\(APIManager.API_IMAGEPATH_ENDPOINT)\(tvSeriesImage)")) { item in
                
                item.resizable()
                    .frame(width: 72, height: 72)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(color: Color.black.opacity(0.5), radius: 12)
                  
            } placeholder: {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 72, height: 72)
                    .foregroundStyle(.gray.opacity(0.1))
            }
            
        
            
            VStack (alignment: .leading) {
                Text(tvSeriesName)
                    .font(.title3)
                    .foregroundStyle(.white)
             
                Text(tvSeriesDesc)
                    .font(.caption)
                    .lineLimit(2)
                    .foregroundStyle(.white.opacity(0.8))
            }.padding(.horizontal)
                
            Spacer()
               
        }.frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color("backgroundHome"))
            
    }
}

#Preview {
    TVSeriesCell(tvSeriesImage: "action", tvSeriesName: "Series Name", tvSeriesDesc: "Tv series description will be here and it may be a bit longer to see how does it look like.")
}
