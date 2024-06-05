//
//  FetchMovieDetailsUseCaseImpl.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import Combine
import NetworkSDK

class FetchMovieDetailsUseCaseImpl: FetchMovieDetailsUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(movieId: Int, language: String) -> AnyPublisher<MovieDetail, NetworkError> {
        return repository.getMovieDetails(movieId: movieId, language: language)
    }
}
