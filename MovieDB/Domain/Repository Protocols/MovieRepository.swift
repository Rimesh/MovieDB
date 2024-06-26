//
//  MovieRepository.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import Combine
import NetworkSDK

protocol MovieRepository {
    func getNowPlayingMovies(page: Int, language: String) -> AnyPublisher<[Movie], NetworkError>
    func getPopularMovies(page: Int, language: String) -> AnyPublisher<[Movie], NetworkError>
    func getMovieDetails(movieId: Int, language: String) -> AnyPublisher<MovieDetail, NetworkError>
}
