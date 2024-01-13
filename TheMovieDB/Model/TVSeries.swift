//
//  TVSeries.swift
//  TheMovieDB
//
//  Created by user on 18.01.2024.
//

import Foundation

struct TVSeries : Decodable {
    var adult: Bool
    var backdropPath: String?
    var createdBy: [CreatedBy]
    var episodeRunTime: [Int]
    var firstAirDate: String
    var genres: [TVSeriesGenre]?
    var homepage: String
    var id: Int
    var inProduction: Bool
    var languages: [String]
    var lastAirDate: String
    var lastEpisodeToAir: LastEpisodeToAir
    var name: String
    var nextEpisodeToAir: String?
    var networks: [Network]
    var numberOfEpisodes: Int
    var numberOfSeasons: Int
    var originCountry: [String]
    var originalLanguage: String
    var originalName: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var productionCompanies: [ProductionCompany]
    var productionCountries: [String]?
    var seasons: [Season]
    var spokenLanguages: [SpokenLanguage]
    var status: String
    var tagline: String?
    var type: String
    var voteAverage: Double
    var voteCount: Int
}

struct CreatedBy: Decodable {
    var id: Int
    var creditId: String
    var name: String
    var gender: Int
    var profilePath: String
}

struct TVSeriesGenre: Decodable {
    var id: Int
    var name: String
}

struct LastEpisodeToAir: Decodable {
    var id: Int
    var name: String
    var overview: String
    var voteAverage: Double
    var voteCount: Int
    var airDate: String
    var episodeNumber: Int
    var episodeType: String
    var productionCode: String
    var runtime: Int
    var seasonNumber: Int
    var showId: Int
    var stillPath: String?
    
}

struct Network: Decodable {
    var id: Int
    var logoPath: String
    var name: String
    var originCountry: String
}

struct ProductionCompany: Decodable {
    var id: Int
    var logoPath: String?
    var name: String
    var originCountry: String
}

struct Season: Decodable {
    var airDate: String
    var episodeCount: Int
    var id: Int
    var name: String
    var overview: String?
    var posterPath: String?
    var seasonNumber: Int
    var voteAverage: Int
}

struct SpokenLanguage: Decodable {
    var englishName: String
    var iso6391: String
    var name: String
}
