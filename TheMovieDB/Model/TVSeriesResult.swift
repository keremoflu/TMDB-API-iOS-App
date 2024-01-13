//
//  TVShowResult.swift
//  TheMovieDB
//
//  Created by user on 17.01.2024.
//

import Foundation

struct TVSeriesResult : Decodable {
    var page: Int
    var results: [TVResult]
    var totalPages: Int
    var totalResults: Int
}

struct TVResult : Decodable {
    var backdropPath: String?
    var firstAirData: String?
    var genreIds: [Int]
    var id: Int
    var name: String
    var originCountry: [String]
    var originalLanguage: String
    var originalName: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var voteAverage: Double
    var voteCount: Int
}
