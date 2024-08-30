//
//  HabitSymbolButtonStyle.swift
//  SwiftIsland Delights
//
//  Created by Malin Sundberg on 2024-08-22.
//

import SwiftUI

struct HabitSymbolButtonStyle: PrimitiveButtonStyle {
    @Environment(\.colorScheme) private var colorScheme

    @State private var isPressed: Bool = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.medium)
            .foregroundStyle(isPressed ? .secondaryAccent : .accent)
            .symbolEffect(isActive: isPressed)
            .padding(Constants.spacing)
            .background {
                Circle()
                    .fill(isPressed ? .secondaryAccent.opacity(colorScheme == .light ? 0.2 : 0.3) : .accent.opacity(colorScheme == .light ? 0.1 : 0.2))
            }
            .onLongPressGesture(minimumDuration: 1, maximumDistance: 10) {
                print("Trigger")
                configuration.trigger()
            } onPressingChanged: { change in
                print("Pressed")
                isPressed = change
            }
    }
}

extension PrimitiveButtonStyle where Self == HabitSymbolButtonStyle {
    static var habitSymbolButtonStyle: Self { Self() }
}

//extension View {
//    @ViewBuilder
//    func symbolEffect(isActive: Bool) -> some View {
//        if #available(iOS 18.0, macOS 15.0, watchOS 11.0, *) {
//            symbolEffect(.wiggle.counterClockwise, options: .nonRepeating.speed(1), value: isActive)
//                .symbolEffect(.bounce, options: .nonRepeating.speed(1), value: isActive)
//        } else {
//            symbolEffect(.bounce, options: .nonRepeating.speed(1), value: isActive)
//        }
//    }
//}
extension View {
    @ViewBuilder
        func symbolEffect(isActive: Bool, effect: any SymbolEffect) -> some View {
            if #available(iOS 18.0, macOS 15.0, watchOS 11.0, *) {
                symbolEffect(.wiggle.counterClockwise, options: .nonRepeating.speed(1), value: isActive)
                    .symbolEffect(.bounce, options: .nonRepeating.speed(1), value: isActive)
            } else {
                symbolEffect(.bounce, options: .nonRepeating.speed(1), value: isActive)
            }
        }
}
