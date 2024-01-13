//
//  SimilarMoviesTab.swift
//  TheMovieDB
//
//  Created by user on 15.01.2024.
//

import SwiftUI

struct SimilarMoviesTab: View {
    
    @StateObject var apiViewModel = APIViewModel()
    var imagePath: String
    var movieId: Int
    
    var body: some View {
        
        ScrollView (.horizontal) {
            HStack {
                ForEach(apiViewModel.moviesSimilar?.results ?? APIManager.exampleMovieResult, id: \.id){ item in
                    NavigationLink (destination: MovieDetailView(movieId: item.id)) {
                        VStack (alignment: .center){
                            
                            AsyncImage(url: URL(string: "\(APIManager.API_IMAGEPATH_ENDPOINT)\(item.posterPath ?? "")" )){ item in
                                
                                item.resizable()
                                    .frame(width: 60, height: 72)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .shadow(color: Color(.black).opacity(0.6), radius: 12)
                            } placeholder: {
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(width: 60, height: 72)
                                    .foregroundStyle(.gray.opacity(0.1))
                                    .shadow(color: Color(.black).opacity(0.6), radius: 12)
                            }.padding(.trailing)
                            
                            Text(Utility().getSeperatedCastName(text: item.originalTitle))
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                    
            }
        }.task {
            apiViewModel.getSimilarMoviesById(id: movieId)
}
    }
}

#Preview {
    SimilarMoviesTab(imagePath: "", movieId: 287)
}
