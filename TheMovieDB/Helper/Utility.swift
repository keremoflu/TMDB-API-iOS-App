//
//  Utility.swift
//  TheMovieDB
//
//  Created by user on 16.01.2024.
//

import Foundation


struct Utility {
    func getSeperatedCastName(text: String) -> String {
        //To show name and surname vertically seperated
        let name = text.components(separatedBy: " ").first
        let surname = text.components(separatedBy: " ").last
        
        return "\(name!)\n\(surname!)"
       
    }
}
