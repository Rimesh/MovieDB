//
//  MovieListView.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Now playing")
            List(viewModel.movies) { movie in
                Text(movie.title)
            }
        }
        .padding()
    }
}
