//
//  PersonDetailView.swift
//  TheMovieDB
//
//  Created by user on 14.01.2024.
//

import SwiftUI

struct PersonDetailView: View {
    
    var personId: Int
    
    @StateObject var apiViewModel = APIViewModel()
    
     var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    
    var body: some View {
       
            
       
        VStack {
            ScrollView{
           GeometryReader { geometry in
                HStack {
                    
                    AsyncImage(url: URL(string: "\(APIManager.API_IMAGEPATH_ENDPOINT)\(apiViewModel.person?.profilePath ?? "")")) { item in
                        
                        item.resizable()
                            .frame(width: 130, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: Color.black.opacity(0.5), radius: 12)
                            .frame(width: geometry.size.width * 0.35, height: 200)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 130, height: 200)
                            .foregroundStyle(.gray.opacity(0.1))
                    }.padding(.leading)
                    
                        
                    
                    
                    VStack (alignment: .leading, spacing: 16) {
                        Text(apiViewModel.person?.name ?? "Name")
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(apiViewModel.person?.knownForDepartment ?? "Acting")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .opacity(0.5)
                        
                        
                        HStack {
                            CircularProgressView(progress: apiViewModel.person?.popularity ?? 0.0)
                                
                            Text("Popularity")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .opacity(0.8)
                                .padding(.leading,8)
                        }
                        
                    }.frame(width: geometry.size.width * 0.65)
                        .padding(.leading, 12)
                }
            }.frame(height: 230)
                    .task {
                        apiViewModel.getPersonById(id: personId)
                    }
                
                
                
                
                
          
            VStack {
                Text("Movies")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                    // 3x3 grid list
                    LazyVGrid(columns: threeColumnGrid, alignment: .leading){
                        
                        ForEach(apiViewModel.moviesOfPerson?.results ??
                                
                APIManager.exampleMovieResult, id: \.id){ item in
                            
                            NavigationLink (destination: MovieDetailView(movieId: item.id)){
                                ImagePoster(imagePath: item.posterPath ?? "")
                            }
                        }
                    }
            }.padding(.leading)
                    .task {
                        apiViewModel.getMoviesOfPerson(personId: String(personId))
                    }
            
            Spacer()
            
          
            
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("backgroundHome"))
            .scrollIndicators(.hidden)
        
        }
    }
}

#Preview {
    PersonDetailView(personId: 287)
}
