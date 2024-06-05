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
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    spacing: 20
                ) {
                    ForEach(viewModel.movies) { movie in
                        VStack {
                            NavigationLink {
                                Text("Movie Details")
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

                            Button("Details") {
                                viewModel.fetchMovieDetails(movieId: movie.id)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Latest releases")
        }
    }
}
