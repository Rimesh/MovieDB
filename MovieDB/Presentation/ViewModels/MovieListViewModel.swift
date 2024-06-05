//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import Combine
import NetworkSDK

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var errorMessage: String?
    @Published var movieDetails: MovieDetail? = nil
    let languageCode = Locale.current.language

    private let fetchMoviesUseCase: FetchMoviesUseCase
    private let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase
    private var cancellables = Set<AnyCancellable>()

    init(
        fetchMoviesUseCase: FetchMoviesUseCase,
        fetchMovieDetailsUseCase: FetchMovieDetailsUseCase
    ) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
        self.fetchMovieDetailsUseCase = fetchMovieDetailsUseCase
        fetchMovies(page: 1)
    }

    func fetchMovies(page: Int, language: String = "en_US") {
        fetchMoviesUseCase.execute(page: page, language: language)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                }
            }, receiveValue: { movies in
                self.movies = movies
            })
            .store(in: &cancellables)
    }

    func fetchMovieDetails(movieId: Int, language: String = "en_US") {
        print("languageCode: \(languageCode)")
        fetchMovieDetailsUseCase.execute(movieId: movieId, language: language)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                }
            }, receiveValue: { movieDetails in
                print(movieDetails)
                self.movieDetails = movieDetails
            })
            .store(in: &cancellables)
    }
}
