//
//  FetchMovieDetailsUseCase.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import Combine
import Foundation
import NetworkSDK

protocol FetchMovieDetailsUseCase {
    func execute(movieId: Int, language: String) -> AnyPublisher<MovieDetail, NetworkError>
}
