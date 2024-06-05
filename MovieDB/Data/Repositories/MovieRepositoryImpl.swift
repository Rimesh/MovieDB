//
//  MovieRepositoryImpl.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import Combine
import Foundation
import NetworkSDK

class MovieRepositoryImpl: MovieRepository {
    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func getMovies(page: Int, language: String) -> AnyPublisher<[Movie], NetworkError> {
        let endPoint = Endpoint(
            path: "/3/movie/now_playing",
            method: .get,
            authorization: .apiKey,
            queryItems: [
                .init(name: "page", value: "\(page)"),
                .init(name: "language", value: language),
            ]
        )
        return networkManager.get(type: BaseResponse<Movie>.self, endPoint: endPoint)
            .map { baseResponse in
                let movies = baseResponse.results
                return movies
            }
            .eraseToAnyPublisher()
    }

    func getMovieDetails(movieId: Int, language: String) -> AnyPublisher<MovieDetail, NetworkError> {
        let endPoint = Endpoint(
            path: "/3/movie/\(movieId)",
            method: .get,
            authorization: .apiKey,
            queryItems: [
                .init(name: "language", value: language),
            ]
        )
        return networkManager.get(type: MovieDetail.self, endPoint: endPoint)
    }
}
