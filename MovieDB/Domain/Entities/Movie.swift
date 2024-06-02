//
//  Movie.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import Foundation

struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
}
