//
//  CastTabView.swift
//  TheMovieDB
//
//  Created by user on 15.01.2024.
//

import SwiftUI

struct CastTabView: View {
    
    var cast: [Cast]
    
    var body: some View {
        
        VStack {
            
            
            ScrollView (.horizontal){
                HStack {
                    ForEach (cast.prefix(10), id: \.castId){ item in
                
                 
                        NavigationLink (destination: PersonDetailView(personId: item.id)){
                            VStack {
                                AsyncImage(url: URL(string: "\(APIManager.API_IMAGEPATH_ENDPOINT)\(item.profilePath ?? "")")) { item in
                                    
                                    item.resizable()
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 999))
                                        .shadow(color: Color.black.opacity(0.5), radius: 12)
                                    
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 999)
                                        .frame(width: 60, height: 60)
                                        .foregroundStyle(.gray.opacity(0.1))
                                }
                                .padding(.bottom, 8)
                            
                                
                                Text(Utility().getSeperatedCastName(text:item.originalName))
                                    .font(.caption)
                                    .fontWeight(.regular)
                                    .lineLimit(2)
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.center)
                            }.padding(.trailing)
                        }
                    }
                }
            }
            
        }.padding()
        
    }
    
    
}

#Preview {
    CastTabView(cast: APIManager.exampleModel.credits.cast)
}
