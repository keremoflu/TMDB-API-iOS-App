//
//  Video.swift
//  TheMovieDB
//
//  Created by user on 14.01.2024.
//

import Foundation

struct Trailer: Decodable {
    var id: Int
    var results: [TrailerResult]
}

struct TrailerResult : Decodable {
    var iso6391: String
    var iso31661: String
    var name: String
    var key: String
    var site: String
    var size: Int
    var type: String
    var official: Bool
    var publishedAt: String
    var id: String
}
