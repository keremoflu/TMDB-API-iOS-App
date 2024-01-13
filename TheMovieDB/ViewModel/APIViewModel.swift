//
//  ContentViewModel.swift
//  TheMovieDB
//
//  Created by user on 13.01.2024.
//

import Foundation

class APIViewModel : ObservableObject {
    
    @Published var movie : Movie? = nil
    @Published var movieResult : MovieResult? = nil
    @Published var moviesTrendingToday : MovieResult? = nil
    @Published var moviesSimilar : MovieResult? = nil
    
    @Published var person : Person? = nil
    @Published var moviesOfPerson: MovieResult? = nil
    
    @Published var moviesByGenre: MovieResult? = nil
    
    @Published var tvSeries: TVSeriesResult? = nil
    @Published var tvSeriesDetail: TVSeries? = nil
    
    @Published var showLoadingView = false

    func getMovieById(id: String) {
        
        guard let url = URL(string: "\("\(APIManager.API_ENDPOINT)/movie/\(id)?api_key=")\(APIManager.API_KEY)&language=en-US&append_to_response=credits") else {
                print("invalidURL")
                return
            }
     
            var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
            
            let headers = ["Authorization":"\(APIManager.API_TOKEN)"]
            request.allHTTPHeaderFields = headers
            request.httpMethod = "GET"
           
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                
                DispatchQueue.main.async {
                    
                    if let httpResponse = response as? HTTPURLResponse {
                            print("statusCode: \(httpResponse.statusCode)")
                        
                        
                        if (httpResponse.statusCode == 200){
                            
                            if let error = error {
                                print("something wrong \(error.localizedDescription)")
                                return
                            }
                            
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            
                            if let data = data {
                                
                                do {
                                    self.movie = try decoder.decode(Movie.self, from: data)
                                   // print(self.movie?.originalTitle ?? "XXXX")
                                   // print(self.movie?.id ?? "XXXX")
                                   // print(self.movie?.imdbId ?? "XXXX")
                                    self.showLoadingView = true
                                } catch {
                                    print(error)
                                   }
                                }
                        }else{
                            print("STATUS CODE IS NOT 200, ERROR OCCURED!!!")
                            }
                        }
                    
                    
                }
                
                
                }
            .resume()
            
          
    }
    
    func getMovieBySearch(text: String) {
        
        guard let url = URL(string: "\(APIManager.API_ENDPOINT)search/movie?query=\(text)&api_key=\(APIManager.API_KEY)") else {
                print("invalidURL")
                return
            }
     
            var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
            
            let headers = ["Authorization":APIManager.API_TOKEN]
            request.allHTTPHeaderFields = headers
            request.httpMethod = "GET"
           
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse {
                        print("statusCode: \(httpResponse.statusCode)")
                    
                    if httpResponse.statusCode == 200 {
                        DispatchQueue.main.async {
                            if let error = error {
                                print("something wrong \(error)")
                                return
                            }
                            
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            
                            if let data = data {
                                
                                do {
                                    self.movieResult = try decoder.decode(MovieResult.self, from: data)
                                    print(self.movieResult ?? "X")
                                } catch {
                                    print(error)
                                   }
                                }
                        }
                    }else{
                        
                        print("STATUS CODE IS NOT 200, ERROR OCCURED!!!")
                        }
                    }
                
                
                
                }
            .resume()
            
          
    }
    
    func getMovieTrendingToday(){
      
        guard let url = URL(string:
                                "\(APIManager.API_ENDPOINT)trending/movie/day?language=en-US?api_key=\(APIManager.API_KEY)")
        else { print("invalidURL")
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        let headers = ["Authorization":"\(APIManager.API_TOKEN)"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
         
            DispatchQueue.main.async {
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                }
                
                if let error = error {
                    print("something wrong \(error)")
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let data = data {
                    
                    do {
                        self.moviesTrendingToday = try decoder.decode(MovieResult.self, from: data)
                        //print(self.moviesTrendingToday ?? "X")
                    } catch {
                        print(error)
                    }
                }
                
                
                
            }
            
        }
        .resume()
        
    }
    
    func getSimilarMoviesById(id: Int){
      
        guard let url = URL(string:
                                "\(APIManager.API_ENDPOINT)movie/\(String(id))/similar?api_key=\(APIManager.API_KEY)")
        else { print("invalidURL")
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        let headers = ["Authorization":"\(APIManager.API_TOKEN)"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
         
            DispatchQueue.main.async {
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                }
                
                if let error = error {
                    print("something wrong \(error)")
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let data = data {
                    
                    do {
                        print("SIMILAR MOVIES LIST \n\n")
                        self.moviesSimilar = try decoder.decode(MovieResult.self, from: data)
                        print(self.person?.name ?? "X")
                    } catch {
                        print(error)
                    }
                }
                
                
                
            }
            
        }
        .resume()
        
    }
    
    func getPersonById(id: Int){
        
          guard let url = URL(string:
                                  "\(APIManager.API_ENDPOINT)person/\(id)?api_key=\(APIManager.API_KEY)")
          else { print("invalidURL")
              return
          }
          
          var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
          
          let headers = ["Authorization":"\(APIManager.API_TOKEN)"]
          request.allHTTPHeaderFields = headers
          request.httpMethod = "GET"
          
          URLSession.shared.dataTask(with: request){ (data, response, error) in
              
           
              DispatchQueue.main.async {
                  
                  if let httpResponse = response as? HTTPURLResponse {
                      print("statusCode: \(httpResponse.statusCode)")
                  }
                  
                  if let error = error {
                      print("something wrong \(error)")
                      return
                  }
                  
                  let decoder = JSONDecoder()
                  decoder.keyDecodingStrategy = .convertFromSnakeCase
                  
                  if let data = data {
                      
                      do {
                          print("PERSON BY ID. ID is \(id)\n\n")
                          self.person = try decoder.decode(Person.self, from: data)
                          print(self.person?.name ?? "X")
                      } catch {
                          print(error)
                      }
                  }
                  
                  
                  
              }
              
          }
          .resume()
          
    }
    
    func getMoviesOfPerson(personId: String){
        guard let url = URL(string:
                                "\(APIManager.API_ENDPOINT)discover/movie?&with_people=\(personId)")
        else { print("invalidURL")
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        let headers = ["Authorization":"\(APIManager.API_TOKEN)"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
         
            DispatchQueue.main.async {
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                }
                
                if let error = error {
                    print("something wrong \(error)")
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let data = data {
                    
                    do {
                        print("MOVIES OF PERSON: \n\n")
                        self.moviesOfPerson = try decoder.decode(MovieResult.self, from: data)
                        print(self.moviesOfPerson?.results.first?.originalTitle ?? "X")
                    } catch {
                        print(error)
                    }
                }
                
                
                
            }
            
        }
        .resume()
    }
    
    func getMoviesByGenreId(genreId: Int){
        guard let url = URL(string:
                                "\(APIManager.API_ENDPOINT)discover/movie?api_key=\(APIManager.API_KEY)&with_genres=\(genreId)")
        else { print("invalidURL")
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        let headers = ["Authorization":"\(APIManager.API_TOKEN)"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
         
            DispatchQueue.main.async {
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                }
                
                if let error = error {
                    print("something wrong \(error)")
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let data = data {
                    
                    do {
                        print("MOVIES BY GENRE: \n\n")
                        self.moviesByGenre = try decoder.decode(MovieResult.self, from: data)
                        print(self.moviesByGenre?.results.first?.originalTitle ?? "X")
                    } catch {
                        print(error)
                    }
                }
                
                
                
            }
            
        }
        .resume()
    }
    
    func getTvSeries(){
        guard let url = URL(string:
                                "\(APIManager.API_ENDPOINT)discover/tv?api_key=\(APIManager.API_KEY)&page=2")
        else { print("invalidURL")
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        let headers = ["Authorization":"\(APIManager.API_TOKEN)"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
         
            DispatchQueue.main.async {
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                }
                
                if let error = error {
                    print("something wrong \(error)")
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let data = data {
                    
                    do {
                        print("MOVIES BY GENRE: \n\n")
                        self.tvSeries = try decoder.decode(TVSeriesResult.self, from: data)
                        print(self.tvSeries?.results.first?.name ?? "X")
                    } catch {
                        print(error)
                    }
                }
                
                
                
            }
            
        }
        .resume()
    }
    
    func getTvSeriesById(tVseriesId: Int){
        guard let url = URL(string:
                                "\(APIManager.API_ENDPOINT)tv/\(tVseriesId)?api_key=\(APIManager.API_KEY)")
        else { print("invalidURL")
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        let headers = ["Authorization":"\(APIManager.API_TOKEN)"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
         
            DispatchQueue.main.async {
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                }
                
                if let error = error {
                    print("something wrong \(error)")
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
             
                
                if let data = data {
                    
                    do {
                        print("TV SERIES DETAIL BY ID: \n\n")
                       
                        self.tvSeriesDetail = try decoder.decode(TVSeries.self, from: data)
                        print(self.tvSeriesDetail?.name ?? "X")
                        print(self.tvSeriesDetail?.genres?.first ?? "X")
                    } catch {
                        print(error)
                    }
                }
                
                
                
            }
            
        }
        .resume()
        
        
    }
}
