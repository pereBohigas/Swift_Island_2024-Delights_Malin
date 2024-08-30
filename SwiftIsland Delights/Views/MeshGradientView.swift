//
//  MeshGradientView.swift
//  SwiftIsland Delights
//
//  Created by Malin Sundberg on 2024-08-27.
//

import SwiftUI

struct MeshGradientView: View {
    var body: some View {
        TimelineView(.animation) { timeline in

//            let centerPointX: Float = Float((sin(timeValue) + cos(timeValue * 0.5) + sin(timeValue * 2)) / 6 + 0.5)
//            let centerPointY: Float = Float((cos(timeLine + .pi/2) + sin(timeValue * 0.7) + cos(timeValue * 1.3)) / 6 + 0.5)
            let centerPointX: Float = Float(sin((timeline.date.timeIntervalSince1970) + 1)/2)
            let centerPointY: Float = Float(sin((timeline.date.timeIntervalSince1970) + 1)/2)

            VStack {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [
                        [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                        [0.0, 0.5], [centerPointX, centerPointY], [1.0, 0.5],
                        [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
                    ],
                    colors: [
                        .accentColor, .primaryOrange, .secondaryAccent,
                        .blue, .orange, .green,
                        .green, .blue, .orange,
                    ],
                    background: .white,
                    smoothsColors:  true
                )
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    MeshGradientView()
}
