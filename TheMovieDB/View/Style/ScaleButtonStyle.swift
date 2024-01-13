//
//  ScaleButtonStyle.swift
//  TheMovieDB
//
//  Created by user on 15.01.2024.
//

import Foundation
import SwiftUI

struct ScaleButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
