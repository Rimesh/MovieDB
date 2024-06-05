//
//  MovieDetailsViewModel.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import Combine
import NetworkSDK

class MovieDetailsViewModel: ObservableObject {
    @Published var movieDetails: MovieDetail? = nil
    @Published var errorMessage: String?
    let languageCode = Locale.current.language.languageCode

    private let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase
    private var cancellables = Set<AnyCancellable>()

    private let movieId: Int

    init(
        movieId: Int,
        fetchMovieDetailsUseCase: FetchMovieDetailsUseCase
    ) {
        self.movieId = movieId
        self.fetchMovieDetailsUseCase = fetchMovieDetailsUseCase
    }

    func fetchMovieDetails(language: String = "en_US") {
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
                self.movieDetails = movieDetails
            })
            .store(in: &cancellables)
    }
}
