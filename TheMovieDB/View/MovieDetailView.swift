//
//  MovieDetailView.swift
//  TheMovieDB
//
//  Created by user on 14.01.2024.
//

import SwiftUI
import SlidingTabView

struct MovieDetailView: View {
    
    @State private var tabIndex = 0
    
    @State var movieId: Int
    @Environment(\.dismiss) var dismiss
    
    @StateObject var apiViewModel = APIViewModel()

    
    var body: some View {
        
        
        VStack {
            ZStack (alignment: .center) {
                
                ZStack (alignment: .topLeading){
                    
                                ScrollView {
                                   
                                    VStack (alignment: .leading) {
                                        
                                        //Top Image Title View
                                        ZStack (alignment: .bottom) {
                                           
                                            
                                            
                                            AsyncImage(url: URL(string: "\(APIManager.API_IMAGEPATH_ENDPOINT)\(apiViewModel.movie?.posterPath ?? "")")) { item in
                                                
                                                item.resizable()
                                                    .frame(maxWidth: .infinity, maxHeight: 460)
                                                    .clipShape(RoundedRectangle(cornerRadius: 24))
                                                    .shadow(color: Color.black.opacity(0.5), radius: 12)
                                                
                                            } placeholder: {
                                                RoundedRectangle(cornerRadius: 16)
                                                    .frame(maxWidth: .infinity, maxHeight: 460)
                                                    .foregroundStyle(.gray.opacity(0.1))
                                            }
                                            
                                            HStack {
                                                
                                                VStack (alignment: .leading){
                                                    Text(apiViewModel.movie?.originalTitle ?? "Title")
                                                        .font(.title)
                                                        .fontWeight(.bold)
                                                        .foregroundStyle(.white)
                                                        .frame(maxHeight: .infinity, alignment: .bottomLeading)
                                                        .padding(.horizontal)
                                                    
                                                    Text(getTrimmedDateYear(text: apiViewModel.movie?.releaseDate ?? ""))
                                                            .font(.callout)
                                                            .foregroundStyle(.gray)
                                                            .padding(.leading)
                                                            .padding(.vertical, 4)
                                                }
                                                
                                                Spacer()
                                                
                                                HStack {
                                                    Text("IMDB \(String(format: "%.1f", apiViewModel.movie?.voteAverage ?? ""))")
                                                        .font(.caption)
                                                        .fontWeight(.semibold)
                                                        
                                                }
                                                .padding(6)
                                                .padding(.horizontal, 10)
                                                .background(.yellow)
                                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                                    .frame(maxHeight: .infinity, alignment: .bottomLeading)
                                                    .padding()
                                                
                                            }.frame(maxWidth: .infinity, maxHeight: 120)
                                                .background(
                                                    LinearGradient(gradient: Gradient(colors: [.black, .black.opacity(0)]), startPoint: .bottom, endPoint: .top)
                                                )
                                        }
                                        
                                        //Chip Genre View
                                        ScrollView (.horizontal){
                                                HStack {
                                                    ForEach(apiViewModel.movie?.genres ?? APIManager.exampleModel.genres, id: \.id){ item in
                                                    ChipView(chipName: item.name)
                                                }
                                            }
                                        }.padding(.leading)
                                        
                                        //Overview Description
                                        VStack (alignment: .leading) {
                                            Text("Overview:")
                                                .font(.body)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.white)
                                                .padding(.leading)
                                                .padding(.top)
                                            
                                            Text(apiViewModel.movie?.overview ?? "")
                                                .font(.callout)
                                                .fontWeight(.light)
                                                .foregroundStyle(.white)
                                                .padding(.leading)
                                                .padding(.top, 2)
                                                .opacity(0.7)
                                            
                                        }
                                        
                                        //Sliding Tab Views
                                        SlidingTabView(selection: $tabIndex, tabs: ["Cast","Similar"],
                                                       activeAccentColor: .white, selectionBarColor: .yellow
                                            .opacity(0.7),
                                                       inactiveTabColor: .white.opacity(0.05), activeTabColor: .white.opacity(0.05))
                                       
                                        .clipShape(
                                            .rect (
                                                topLeadingRadius: 16,
                                                topTrailingRadius: 16
                                            )
                                        )
                                        .foregroundStyle(.white)
                                        .padding(.top)
                                        
                                        if tabIndex == 0 {
                                            CastTabView(cast: apiViewModel.movie?.credits.cast ?? APIManager.exampleModel.credits.cast)
                                            
                                        } else if tabIndex == 1 {
                                            
                                            SimilarMoviesTab(imagePath: "", movieId: movieId)
                                                .foregroundStyle(.white)
                                        }
                                         
                                        HStack (alignment: .top){
                                            Text("Production Companies:")
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.white)
                                            
                                            Spacer()
                                            
                                            Text("The Mount Company, Fox Century, Metro Goldwyn-Mayer, Orion Pictures")
                                                .font(.caption)
                                                .fontWeight(.light)
                                                .foregroundStyle(.white)
                                            
                                        }.padding()
                                        
                                        //Spacer()
                                    }
                                    .task {
                                        apiViewModel.getMovieById(id: String(movieId))
                                       
                                    }.opacity(apiViewModel.showLoadingView ? 1 : 0)
                                }.frame(maxHeight: .infinity)
                            
                    
                    Button {
                        dismiss()
                    } label: {
                        CustomBackButton()
                    }
                .padding(.leading, 18).padding(.top,48)
                   
                     
                    }
                
                ProgressLoadingView()
                    .opacity(apiViewModel.showLoadingView ? 0 : 1)
            }
        }
            
            
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("backgroundHome"))
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        
    }
    
    func getTrimmedDateYear(text: String) -> String {
        return text.components(separatedBy: "-").first ?? "Unknown"
    }
}

#Preview {
    MovieDetailView(movieId: 550)
}

struct CustomBackButton: View {
    var body: some View {
        Image(systemName: "chevron.left")
            .font(.caption2)
            .foregroundStyle(.black)
            .padding(10)
            .background(Circle().foregroundStyle(.white).opacity(0.5))
    }
}



