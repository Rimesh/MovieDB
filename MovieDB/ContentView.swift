//
//  ContentView.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import SwiftUI

struct ContentView: View {
    let container: DIContainer
    var body: some View {
        TabView {
            MovieListView(
                viewModel: container.movieViewModelFactory.makeNowPlayingMoviesListViewModel()
            )
            .tabItem {
                Label("Now Playing", systemImage: "play.rectangle")
            }

            MovieListView(
                viewModel: container.movieViewModelFactory.makePopularMoviesListViewModel()
            )
            .tabItem {
                Label("Popular", systemImage: "star.square")
            }
        }
    }
}
