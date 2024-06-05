//
//  AsyncImageView.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ShimmerView()
            case let .success(image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure:
                Image(systemName: "movieclapper")
            @unknown default:
                EmptyView()
            }
        }
    }
}
