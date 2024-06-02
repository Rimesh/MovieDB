//
//  FetchMoviesUseCase.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import Combine
import Foundation
import NetworkSDK

protocol FetchMoviesUseCase {
    func execute(page: Int, language: String) -> AnyPublisher<[Movie], NetworkError>
}
