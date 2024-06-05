//
//  MovieInfoView.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import SwiftUI

struct MovieInfoView: View {
    let posterPath: String
    let title: String
    let releaseDate: String
    let rating: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let url = URLHelper.posterImageURL(from: posterPath) {
                AsyncImageView(url: url)
                    .frame(height: 220)
            }

            VStack(alignment: .leading) {
                Text(title)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.headline)

                Text(releaseDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 8)
            .padding(.top, 4)
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(.all, 8)
    }
}
