//
//  MovieRepository.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import Combine
import NetworkSDK

protocol MovieRepository {
    func getMovies(page: Int, language: String) -> AnyPublisher<[Movie], NetworkError>
}
