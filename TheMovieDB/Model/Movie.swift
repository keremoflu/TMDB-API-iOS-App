//
//  Movie.swift
//  TheMovieDB
//
//  Created by user on 13.01.2024.
//

import Foundation

struct Movie: Decodable {
    
    var adult: Bool
    var backdropPath: String
    var belongsToCollection: BelongsToCollection?
    var budget: Int
    var genres: [Genre]
    var homepage: String
    var id: Int
    var imdbId: String
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var productionCompanies: [ProductionCompanies]
    var productionCountries: [ProductionCountries]
    var releaseDate: String
    var revenue: Int
    var runtime: Int
    var spokenLanguages: [SpokenLanguages]
    var status: String
    var tagline: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int
    var posterPath: String
    var credits: Credits
}


struct BelongsToCollection: Decodable {
    var id: Int
    var name: String
    var posterPath: String
    var backdropPath: String? //nullable
}

struct Genre: Decodable {
    var id: Int
    var name: String
}

struct ProductionCompanies: Decodable {
    var id: Int
    var logoPath: String?
    var name: String
    var originCountry: String
}

struct ProductionCountries: Decodable {
    var iso31661: String
    var name: String
}

struct SpokenLanguages: Decodable {
    var englishName: String
    var iso6391: String
    var name: String
}

struct Credits: Decodable {
    var cast: [Cast]
    var crew: [Crew]
}

struct Cast: Decodable {
    var adult: Bool
    var gender: Int
    var id: Int
    var knownForDepartment: String
    var name: String
    var originalName: String
    var popularity: Double
    var profilePath: String?
    var castId: Int
    var character: String
    var creditId: String
    var order: Int
}

struct Crew: Decodable {
    var adult: Bool
    var gender: Int
    var id: Int
    var knownForDepartment: String
    var name: String
    var originalName: String
    var popularity: Double
    var profilePath: String?
    var creditId: String
    var department: String
    var job: String
}
