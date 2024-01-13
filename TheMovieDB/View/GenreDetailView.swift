//
//  GenreDetailView.swift
//  TheMovieDB
//
//  Created by user on 17.01.2024.
//

import SwiftUI

struct GenreDetailView: View {
    
    @StateObject var apiViewModel = APIViewModel()
    var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var genreId: Int
    var genreName: String
    
    var body: some View {
       
        VStack {
            
            
            ZStack {
                Image(genreName.lowercased()) //images on asset folder are saved as lowercased name
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .overlay {
                        Rectangle().foregroundStyle(.black).opacity(0.4)
                    }
                
                Text("\(genreName) Movies")
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
            }
            
            ScrollView (.vertical) {
                LazyVGrid(columns: threeColumnGrid, alignment: .leading){
                    
                    ForEach (apiViewModel.moviesByGenre?.results ??
                             
                             APIManager.exampleMovieResult, id: \.id){ item in
                    
                        NavigationLink (destination: MovieDetailView(movieId: item.id)) {
                            ZStack {
                                
                                AsyncImage(url: URL(string: "\(APIManager.API_IMAGEPATH_ENDPOINT)\(item.posterPath ?? "")" )){ item in
                                    
                                    item.resizable()
                                        .frame(width: 120, height: 160)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .shadow(color: Color(.black).opacity(0.6), radius: 12)
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(width: 120, height: 160)
                                        .foregroundStyle(.gray.opacity(0.1))
                                        .shadow(color: Color(.black).opacity(0.6), radius: 12)
                                }.padding(.trailing)
                                
                            } .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                           
                    }
                    
                }
            }.task {
                apiViewModel.getMoviesByGenreId(genreId: genreId)
            }
            
            
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(Color("backgroundHome"))
        
        
    }
}

#Preview {
    GenreDetailView(genreId: 28, genreName: "Action")
}
