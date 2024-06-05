//
//  FetchPopularMoviesUseCaseImpl.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import Combine
import NetworkSDK

class FetchPopularMoviesUseCaseImpl: FetchMoviesUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(page: Int, language: String) -> AnyPublisher<[Movie], NetworkError> {
        return repository.getPopularMovies(page: page, language: language)
    }
}
