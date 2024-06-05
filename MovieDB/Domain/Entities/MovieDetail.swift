//
//  MovieDetail.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import Foundation

struct MovieDetail: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let budget: Int
    let genres: [GenreInfo]
    let id: Int
    let homepage: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let tagline: String
    let title: String

    struct GenreInfo: Codable, Identifiable {
        let id: Int
        let name: String
    }
}
