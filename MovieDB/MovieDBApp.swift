//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import NetworkSDK
import SwiftUI

@main
struct MovieDBApp: App {
    let container = DIContainer()
    var body: some Scene {
        WindowGroup {
            ContentView(container: container)
                .environmentObject(container.movieViewModelFactory)
        }
    }
}
