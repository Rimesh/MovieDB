//
//  MovieDetailsView.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject private var viewModel: MovieDetailsViewModel

    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("Hello, World!")
            .onAppear {
                viewModel.fetchMovieDetails()
            }
    }
}
