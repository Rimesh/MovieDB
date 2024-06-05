//
//  MovieListViewModelTests.swift
//  MovieDBTests
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import Combine
@testable import MovieDB
import NetworkSDK
import XCTest

final class MovieListViewModelTests: XCTestCase {
    var mockFetchNowPlayingMoviesUseCase: MockFetchNowPlayingMoviesUseCase!
    var viewModel: MovieListViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        try? super.setUpWithError()
        mockFetchNowPlayingMoviesUseCase = MockFetchNowPlayingMoviesUseCase()
        viewModel = MovieListViewModel(
            navigationTitle: "Now Playing",
            fetchMoviesUseCase: mockFetchNowPlayingMoviesUseCase
        )
        cancellables = []
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        mockFetchNowPlayingMoviesUseCase = nil
        viewModel = nil
        cancellables = nil
    }

    func testFetchNowPlayingMoviesFirstPage() {
        // Given
        let movies = [
            Movie(
                adult: true,
                backdropPath: "/abcd123.jpg",
                genreIds: [1, 2, 3],
                id: 1234,
                originalLanguage: "English",
                originalTitle: "Test Movie",
                overview: "This is a test moviee",
                popularity: 101.002,
                posterPath: "/xyz123.jpg",
                releaseDate: "2024-05-08",
                title: "Test Movie"
            ),
        ]
        mockFetchNowPlayingMoviesUseCase.result = .success(movies)

        // When
        viewModel.fetchMovies(page: 1)

        // Then
        let expectation = XCTestExpectation(description: "Fetch now plaing movies first page")
        viewModel.$movies
            .dropFirst()
            .sink { fetchedMovies in
                XCTAssertEqual(fetchedMovies, movies)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchNowPlayingMoviesFailure() {
        // Given
        mockFetchNowPlayingMoviesUseCase.result = .failure(NetworkError.requestTimeOut)

        // When
        viewModel.fetchMovies(page: 1)

        // Then
        let expectation = XCTestExpectation(description: "Fetch now playing movies Error")
        viewModel.$showErrorAlert
            .dropFirst()
            .sink { showError in
                XCTAssertTrue(showError)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}

extension Movie: Equatable {
    public static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
            && lhs.adult == rhs.adult
            && lhs.backdropPath == rhs.backdropPath
            && lhs.genreIds == rhs.genreIds
            && lhs.originalLanguage == rhs.originalLanguage
            && lhs.originalTitle == rhs.originalTitle
            && lhs.overview == rhs.overview
            && lhs.popularity == rhs.popularity
            && lhs.posterPath == rhs.posterPath
            && lhs.releaseDate == rhs.releaseDate
            && lhs.title == rhs.title
    }
}
