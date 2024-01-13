//
//  Person.swift
//  TheMovieDB
//
//  Created by user on 15.01.2024.
//

import Foundation

struct Person : Decodable {
    var adult: Bool?
    var alsoKnownAs: [String]
    var biography: String
    var birthday: String?
    var deathday: String?
    var gender: Int
    var homepage: String?
    var id: Int
    var imdb_id : String?
    var knownForDepartment: String
    var name: String
    var placeOfBirth: String?
    var popularity: Double
    var profilePath: String?
}
