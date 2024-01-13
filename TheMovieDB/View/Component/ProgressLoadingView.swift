//
//  ProgressLoadingVİew.swift
//  TheMovieDB
//
//  Created by user on 17.01.2024.
//

import SwiftUI

struct ProgressLoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .scaleEffect(2)
            .padding()
    }
}
