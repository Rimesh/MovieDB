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
            Text("Latest releases")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.movies) { movie in
                        MovieInfoCell(
                            movieImage: "bunny",
                            title: movie.title,
                            releaseDate: movie.releaseDate,
                            rating: "\(movie.popularity)"
                        )
                    }
                }
            }
        }
        .padding()
    }
}
