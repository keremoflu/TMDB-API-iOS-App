//
//  CircularProgressView.swift
//  TheMovieDB
//
//  Created by user on 14.01.2024.
//

import SwiftUI

struct CircularProgressView: View {
    
    let progress: Double
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(
                    Color.white.opacity(0.25),
                lineWidth: 6)
            
            Circle()
                .trim(from: 0, to: getConvertedProgressValue(value: progress))
                .stroke(
                    Color.blue,
                    style: StrokeStyle(
                        lineWidth: 6,
                        lineCap: .round
                )
                    )
                .rotationEffect(.degrees(-90))
            
        }
        .frame(width: 32, height: 32)
        
    }
    
    func getConvertedProgressValue(value: Double) -> Double {
        //Max progress value is 1
        //Convert value (max 500) ouf of 1
        
        var progressValue = 0.0
        
        if(value > 500.0){
            progressValue = 500.0
        }else{
            progressValue = value
        }
        
     
        return progressValue * 0.007
        
    }
}

#Preview {
    CircularProgressView(progress: 0.5)
}
