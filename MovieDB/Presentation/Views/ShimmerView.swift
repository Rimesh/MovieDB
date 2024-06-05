//
//  ShimmerView.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import SwiftUI

struct ShimmerView: View {
    @State private var phase: CGFloat = 0

    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.1), Color.gray.opacity(0.3)]),
                               startPoint: .leading,
                               endPoint: .trailing)
            )
            .rotationEffect(Angle(degrees: 30))
            .mask(Rectangle().cornerRadius(8))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: phase)
            .onAppear {
                phase = 1
            }
    }
}
