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
    @Published var showErrorAlert = false
    private(set) var errorMessage: String = ""
    private(set) var navigationTitle: String

    private let fetchMoviesUseCase: FetchMoviesUseCase
    private var cancellables = Set<AnyCancellable>()

    init(
        navigationTitle: String,
        fetchMoviesUseCase: FetchMoviesUseCase
    ) {
        self.navigationTitle = navigationTitle
        self.fetchMoviesUseCase = fetchMoviesUseCase
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
                    self.showErrorAlert = true
                }
            }, receiveValue: { movies in
                self.movies = movies
            })
            .store(in: &cancellables)
    }
}
