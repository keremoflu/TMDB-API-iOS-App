//
//  Genres.swift
//  TheMovieDB
//
//  Created by user on 17.01.2024.
//

import Foundation

struct Genres {
    var id: Int
    var name: String
    var image: String
    
    static var genreList = [
        //IDs are same with TMDB movie ids. We create custom genre list with custom images.
        
        Genres(id: 28, name: "Action", image: "action"),
        Genres(id: 12, name: "Adventure", image: "adventure"),
        Genres(id: 35, name: "Comedy", image: "comedy"),
        Genres(id: 80, name: "Crime", image: "crime"),
        Genres(id: 99, name: "Documentary", image: "documentary"),
        Genres(id: 27, name: "Horror", image: "horror"),
    ]
}


