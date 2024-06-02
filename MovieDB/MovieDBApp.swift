//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import SwiftUI
import NetworkSDK

@main
struct MovieDBApp: App {
    var body: some Scene {
        WindowGroup {
            let configuration = NetworkConfiguration(
                baseURL: try! Configuration.value(for: "BASE_URL_HOST"),
                apiKey: try! Configuration.value(for: "API_KEY")
            )
            let networkManager = NetworkManager(configuration: configuration)
            ContentView()
        }
    }
}
