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
        MovieListView(viewModel: container.makeMovieListViewModel())
    }
}
