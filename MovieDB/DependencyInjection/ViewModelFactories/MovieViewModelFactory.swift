//
//  MovieViewModelFactory.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import SwiftUI

class MovieViewModelFactory: ObservableObject {
    private let fetchMoviesUseCase: FetchMoviesUseCase
    private let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase

    init(fetchMoviesUseCase: FetchMoviesUseCase, fetchMovieDetailsUseCase: FetchMovieDetailsUseCase) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
        self.fetchMovieDetailsUseCase = fetchMovieDetailsUseCase
    }

    func makeMovieListViewModel() -> MovieListViewModel {
        return MovieListViewModel(fetchMoviesUseCase: fetchMoviesUseCase)
    }

    func makeMovieDetailsViewModel(movieId: Int) -> MovieDetailsViewModel {
        return MovieDetailsViewModel(movieId: movieId, fetchMovieDetailsUseCase: fetchMovieDetailsUseCase)
    }
}
