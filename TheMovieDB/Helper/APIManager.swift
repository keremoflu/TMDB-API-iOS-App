//
//  APIManager.swift
//  TheMovieDB
//
//  Created by user on 13.01.2024.
//

import Foundation

struct APIManager {
    
    static var API_ENDPOINT = "https://api.themoviedb.org/3/"
    static var API_KEY = "e428153e5055fdf4c90466f35a1f5afa"
    static var API_TOKEN = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNDI4MTUzZTUwNTVmZGY0YzkwNDY2ZjM1YTFmNWFmYSIsInN1YiI6IjVhOTZmNTExYzNhMzY4NjE1YTAwMTU0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RQF434cNcc_5G5zGm5m67aT9IoCmRGKgivfh0rOSFhI"
    static var API_IMAGEPATH_ENDPOINT = "https://image.tmdb.org/t/p/w500"
    
    static var exampleModel: Movie = Movie(adult: false, backdropPath: "xxx",
                                           belongsToCollection: BelongsToCollection(id: 1, name: "CollectionName", posterPath: "/poster", backdropPath: "/backdrop"), budget: 10222,
                                           
                                           genres: [
                                            Genre(id: 1, name: "Action"),
                                            Genre(id: 2, name: "Comedy"),
                                            Genre(id: 3, name: "Drama")
                                           ],
                                           
                                           homepage: "homepage link XXX", id: 3, imdbId: "dsa2dasdas", originalLanguage: "en", originalTitle: "Title movie original", overview: "Hi Friends! This is my first Movie App UI Exploration, where you can find and watch movies and TV series. Glad to see your thoughts Please do not forget to show some love by pressing “L” Thanks", popularity: 5.1,
                                           
                                           productionCompanies: [ProductionCompanies(id: 2, logoPath: "/logoPath", name: "Company 1",
                                                                                     originCountry: "en")],
                                           
                                           productionCountries: [ProductionCountries(iso31661: "isoxxxx", name: "name")],
                                           
                                           releaseDate: "1994-04-19", revenue: 1203231, runtime: 11,
                                           
                                           spokenLanguages: [SpokenLanguages(englishName: "TR", iso6391: "isoxxx", name: "lang name")],
                                           
                                           status: "status", tagline: "tagline", title: "title", video: false, voteAverage: 5.8, voteCount: 832, posterPath: "posterPath", credits: Credits(cast: [
                                            
                                            Cast(adult: true, gender: 1,
                                                 id: 11, knownForDepartment: "Acting", name: "Kerem", originalName: "Kerem", popularity: 11.2, profilePath: "/...", castId: 5, character: "Character", creditId: "creditId", order: 1)
                                           
                                           ], crew: [Crew(adult: false, gender: 2, id: 2, knownForDepartment: "department", name: "name", originalName: "originalname", popularity: 44.0, profilePath: "/..", creditId: "creditId", department: "department", job: "job")]))
    
    static var exampleMovieResult: [Result] = [Result(adult: false, genreIds: [], id: 2, originalLanguage: "", originalTitle: "", overview: "", popularity: 0.0, releaseDate: "", title: "", video: false, voteAverage: 0.0, voteCount: 0)]
    
    static var exampleTvShowResult: [TVResult] = [TVResult(backdropPath: "", firstAirData: "", genreIds: [0], id: 1, name: "", originCountry: [""], originalLanguage: "", originalName: "", overview: "", popularity: 0.0, posterPath: "", voteAverage: 0.0, voteCount: 0)]
    
    static var exampleTVSeries: [TVSeries] = [TVSeries(adult: false, backdropPath: "", createdBy: [CreatedBy(id: 1, creditId: "1", name: "", gender: 0, profilePath: "")], episodeRunTime: [0], firstAirDate: "", genres: [TVSeriesGenre(id: 1, name: "")], homepage: "", id: 0, inProduction: false, languages: ["en"], lastAirDate: "", lastEpisodeToAir: LastEpisodeToAir(id: 1, name: "", overview: "", voteAverage: 0.0, voteCount: 0, airDate: "", episodeNumber: 0, episodeType: "", productionCode: "", runtime: 1, seasonNumber: 2, showId: 3, stillPath: ""), name: "", networks: [Network(id: 1, logoPath: "", name: "", originCountry: "")], numberOfEpisodes: 0, numberOfSeasons: 3, originCountry: [""], originalLanguage: "", originalName: "", overview: "", popularity: 0.0, posterPath: "", productionCompanies: [ProductionCompany(id: 1, name: "", originCountry: "")], seasons: [Season(airDate: "", episodeCount: 0, id: 0, name: "", posterPath: "", seasonNumber: 1, voteAverage: 2)], spokenLanguages: [SpokenLanguage(englishName: "", iso6391: "", name: "")], status: "", type: "", voteAverage: 0.0, voteCount: 0)]
}
