//
//  MockFetchNowPlayingMoviesUseCase.swift
//  MovieDBTests
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import Combine
@testable import MovieDB
import NetworkSDK

class MockFetchNowPlayingMoviesUseCase: FetchMoviesUseCase {
    var result: Result<[Movie], NetworkError>?

    func execute(page _: Int, language _: String) -> AnyPublisher<[Movie], NetworkError> {
        guard let result = result else {
            return Fail(error: NetworkError.requestTimeOut)
                .eraseToAnyPublisher()
        }
        return result
            .publisher
            .eraseToAnyPublisher()
    }
}
