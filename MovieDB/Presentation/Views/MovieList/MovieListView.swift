//
//  MovieListView.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import SwiftUI

struct MovieListView: View {
    @EnvironmentObject private var viewModelFactory: MovieViewModelFactory
    @ObservedObject private var viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    spacing: 20
                ) {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink {
                            MovieDetailsView(
                                viewModel: viewModelFactory.makeMovieDetailsViewModel(movieId: movie.id)
                            )
                        } label: {
                            MovieInfoView(
                                posterPath: movie.posterPath,
                                title: movie.title,
                                releaseDate: movie.releaseDate,
                                rating: "\(movie.popularity)"
                            )
                            .clipped()
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Latest releases")
        }
    }
}
