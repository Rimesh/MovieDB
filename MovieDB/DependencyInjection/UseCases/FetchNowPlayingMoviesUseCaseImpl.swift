//
//  FetchNowPlayingMoviesUseCaseImpl.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import Combine
import NetworkSDK

class FetchNowPlayingMoviesUseCaseImpl: FetchMoviesUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(page: Int, language: String) -> AnyPublisher<[Movie], NetworkError> {
        return repository.getNowPlayingMovies(page: page, language: language)
    }
}
