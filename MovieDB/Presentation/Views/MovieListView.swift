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

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Latest releases")
                ScrollView(showsIndicators: false) {
                    LazyVGrid(
                        columns: columns,
                        spacing: 20
                    ) {
                        ForEach(viewModel.movies) { movie in
                            MovieInfoView(
                                posterPath: movie.posterPath,
                                title: movie.title,
                                releaseDate: movie.releaseDate,
                                rating: "\(movie.popularity)"
                            )
                            .clipped()
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
