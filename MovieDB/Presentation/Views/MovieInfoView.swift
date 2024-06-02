//
//  MovieInfoView.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 02/06/24.
//

import SwiftUI

struct MovieInfoCell: View {
    let movieImage: String
    let title: String
    let releaseDate: String
    let rating: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(movieImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 235)
                .padding(.bottom, 10)

            VStack(alignment: .leading) {
                Text(title)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.headline)

                Text(releaseDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .overlay(
                Rectangle()
                    .stroke(Color.red, lineWidth: 2)
            )
            Spacer()
        }
        .frame(width: 200, height: 350)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.all, 10)
    }
}
