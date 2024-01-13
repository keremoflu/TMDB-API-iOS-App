//
//  ContentView.swift
//  TheMovieDB
//
//  Created by user on 13.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var apiViewModel = APIViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack (alignment: .leading){
                        Text("Trending Today")
                             .font(.title)
                             .fontWeight(.semibold)
                             .foregroundStyle(.white)
                             .frame(maxWidth: .infinity, alignment: .leading)
                             .padding(.leading)
                        
                        //Trending Today
                        VStack {
                            ScrollView(.horizontal){
                                HStack {
                                    ForEach(apiViewModel.moviesTrendingToday?.results ??
                                            [Result](), id: \.id){ item in
                                        
                                        NavigationLink(destination: MovieDetailView(movieId: item.id)){
                                          
                                            TrendingMovie(imagePath: item.posterPath!, rate: item.voteAverage)
                                        }
                                    }
                                }
                                
                            }
                            
                        }
                        .task {
                           apiViewModel.getMovieTrendingToday()
                        }
                        
                        //Genre List
                        Text("Genres")
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundStyle(.white)
                            .padding(.leading)
                        ScrollView (.horizontal) {
                            HStack {
                                ForEach (Genres.genreList, id:\.id){ item in
                                    NavigationLink (destination: GenreDetailView(genreId: item.id, genreName: item.name)) {
                                        GenreCell(imageText: item.name, imageName: item.image)
                                    }.buttonStyle(.plain) //to avoid navigation link blue overlay color
                                }
                            }
                        }.padding(.bottom)
                        
                        
                        HStack {
                            Text("Featured TV Series")
                                .font(.title2)
                                .fontWeight(.light)
                                .foregroundStyle(.white)
                                .padding(.leading)
                         
                        }
                        
                        ScrollView (.vertical){
                            VStack {
                                ForEach (apiViewModel.tvSeries?.results.prefix(3) ?? APIManager.exampleTvShowResult.prefix(3), id: \.id){ item in
                                        
                                    NavigationLink (destination: MovieDetailView(movieId: item.id)) {
                                        TVSeriesCell(tvSeriesImage: item.posterPath, tvSeriesName: item.name, tvSeriesDesc: item.overview)
                                            .padding(.leading).padding(.vertical, 8)
                                    }
                                }
                            }.task {
                                apiViewModel.getTvSeries()
                            }
                        }
                        
                        
                        
                        
                        //OnTheatreView()
                        
                        
                        
                            
                    }
                            
                   
                    
                    Spacer()
                }
            }
           .background(Color("backgroundHome"))
               
        }
      
    }
    
 
}

#Preview {
    ContentView()
}

struct OnTheatreView: View {
    var body: some View {
        VStack {
            HStack {
                
                Image("movie")
                    .resizable()
                    .frame(width: 50, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .opacity(0.5)
                
                Image("movie")
                    .resizable()
                    .frame(width: 50, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .opacity(0.5)
                
                Image("movie")
                    .resizable()
                    .frame(width: 50, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .opacity(0.5)
                
                
                
                Text("Movies Now \non Theatre!")
                    .font(.body)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
                    .padding(.leading)
            }
        }.frame(maxWidth: .infinity, maxHeight: 160)
            .padding()
            .background(.gray.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding()
    }
}
