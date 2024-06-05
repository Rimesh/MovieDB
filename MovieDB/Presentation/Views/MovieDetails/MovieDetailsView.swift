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
        VStack {
            if let details = viewModel.movieDetails {
                VStack {
                    backdropView(path: details.backdropPath)
                    VStack(alignment: .leading) {
                        Text(details.title)
                            .font(.title)
                            .fontWeight(.medium)
                        Text(details.tagline)
                            .font(.title3)
                            .italic()
                        Text("Overview")
                            .font(.headline)
                        Text(details.overview)
                            .foregroundStyle(Color.secondary)
                    }
                    .padding(.horizontal)

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Budget")
                            Text("$" + details.budget.formatted())
                        }
                        .frame(maxWidth: .infinity)
                        VStack(alignment: .leading) {
                            Text("Revenue")
                            Text("$" + details.revenue.formatted())
                        }
                        .frame(maxWidth: .infinity)
                    }
                    Spacer()
                        .frame(height: 80)
                }
            } else {
                EmptyView()
            }
        }
        .onAppear {
            viewModel.fetchMovieDetails()
        }
    }

    func backdropView(path _: String) -> some View {
        VStack {
            if let path = viewModel.movieDetails?.backdropPath,
               let url = URLHelper.backdropImageURL(from: path)
            {
                AsyncImageView(url: url)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        Rectangle()
                            .strokeBorder(style: .init(lineWidth: 1))
                    }
            } else {
                EmptyView()
            }
        }
    }
}
