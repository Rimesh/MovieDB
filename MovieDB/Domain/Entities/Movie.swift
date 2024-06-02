//
//  Movie.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import Foundation

struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int
    let original_language: String?
    let original_title: String?
    let overview: String
    let popularity: Double
    let poster_path: String?
    let release_date: String?
    let title: String
}
