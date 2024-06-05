//
//  MovieViewModelFactory.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import SwiftUI

class MovieViewModelFactory: ObservableObject {
    private let fetchNowPlayingMoviesUseCase: FetchMoviesUseCase
    private let fetchPopularMoviesUseCase: FetchMoviesUseCase
    private let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase

    init(
        fetchNowPlayingMoviesUseCase: FetchMoviesUseCase,
        fetchPopularMoviesUseCase: FetchMoviesUseCase,
        fetchMovieDetailsUseCase: FetchMovieDetailsUseCase
    ) {
        self.fetchNowPlayingMoviesUseCase = fetchNowPlayingMoviesUseCase
        self.fetchPopularMoviesUseCase = fetchPopularMoviesUseCase
        self.fetchMovieDetailsUseCase = fetchMovieDetailsUseCase
    }

    func makeNowPlayingMoviesListViewModel() -> MovieListViewModel {
        return MovieListViewModel(
            navigationTitle: "Now Playing",
            fetchMoviesUseCase: fetchNowPlayingMoviesUseCase
        )
    }

    func makePopularMoviesListViewModel() -> MovieListViewModel {
        return MovieListViewModel(
            navigationTitle: "Popular",
            fetchMoviesUseCase: fetchPopularMoviesUseCase
        )
    }

    func makeMovieDetailsViewModel(movieId: Int) -> MovieDetailsViewModel {
        return MovieDetailsViewModel(
            movieId: movieId,
            fetchMovieDetailsUseCase: fetchMovieDetailsUseCase
        )
    }
}
