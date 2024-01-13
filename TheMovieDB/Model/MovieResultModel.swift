//
//  SearchedMovie.swift
//  TheMovieDB
//
//  Created by user on 13.01.2024.
//

import Foundation

struct MovieResultModel: Decodable {
    
    var page: Int
    var results: [MyResult]
    var totalPages: Int
    var totalResults: Int
    
}

struct MyResult: Decodable {
    var adult: Bool
    var backdropPath: String? //its null at some responses
    var genreIds: [Int]
    var id: Int
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String?
    var releaseDate: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int
}

