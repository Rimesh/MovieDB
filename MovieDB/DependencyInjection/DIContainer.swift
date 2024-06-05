//
//  DIContainer.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import Combine
import NetworkSDK

class DIContainer {
    private let networkConfiguration: NetworkConfiguration
    private let networkManager: NetworkManager

    private let movieRepository: MovieRepository
    private let fetchMoviesUseCase: FetchMoviesUseCase
    private let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase

    let movieViewModelFactory: MovieViewModelFactory

    init() {
        networkConfiguration = NetworkConfiguration(
            baseURL: try! Configuration.value(for: "BASE_URL_HOST"),
            apiKey: try! Configuration.value(for: "API_KEY")
        )
        networkManager = NetworkManager(configuration: networkConfiguration)

        movieRepository = MovieRepositoryImpl(networkManager: networkManager)
        fetchMoviesUseCase = FetchMoviesUseCaseImpl(repository: movieRepository)
        fetchMovieDetailsUseCase = FetchMovieDetailsUseCaseImpl(repository: movieRepository)

        movieViewModelFactory = .init(
            fetchMoviesUseCase: fetchMoviesUseCase,
            fetchMovieDetailsUseCase: fetchMovieDetailsUseCase
        )
    }
}
