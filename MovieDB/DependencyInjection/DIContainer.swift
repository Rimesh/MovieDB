//
//  DIContainer.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import Combine
import NetworkSDK

class DIContainer {
    let networkConfiguration: NetworkConfiguration
    let networkManager: NetworkManager

    let movieRepository: MovieRepository
    let fetchMoviesUseCase: FetchMoviesUseCase
    let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase

    init() {
        networkConfiguration = NetworkConfiguration(
            baseURL: try! Configuration.value(for: "BASE_URL_HOST"),
            apiKey: try! Configuration.value(for: "API_KEY")
        )
        networkManager = NetworkManager(configuration: networkConfiguration)

        movieRepository = MovieRepositoryImpl(networkManager: networkManager)
        fetchMoviesUseCase = FetchMoviesUseCaseImpl(repository: movieRepository)
        fetchMovieDetailsUseCase = FetchMovieDetailsUseCaseImpl(repository: movieRepository)
    }

    func makeMovieListViewModel() -> MovieListViewModel {
        return MovieListViewModel(
            fetchMoviesUseCase: fetchMoviesUseCase,
            fetchMovieDetailsUseCase: fetchMovieDetailsUseCase
        )
    }
}
