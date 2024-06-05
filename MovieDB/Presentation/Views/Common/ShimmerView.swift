//
//  ShimmerView.swift
//  MovieDB
//
//  Created by Rimesh Jotaniya on 05/06/24.
//

import SwiftUI

struct ShimmerView: View {
    @State private var startPoint = UnitPoint(x: -1.8, y: -1.2)
    @State private var endPoint = UnitPoint(x: 0, y: -0.2)
    var speed: CGFloat = 1
    var colors: [Color] = [
        Color(uiColor: .systemGray5),
        Color(uiColor: .systemGray6),
        Color(uiColor: .systemGray5),
    ]

    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: startPoint,
            endPoint: endPoint
        )
        .onAppear(perform: loopAnimation)
    }

    private func loopAnimation() {
        withAnimation(
            .easeInOut(duration: speed)
                .repeatForever(autoreverses: false)
        ) {
            startPoint = .init(x: 1, y: 1)
            endPoint = .init(x: 2.2, y: 2.2)
        }
    }
}
