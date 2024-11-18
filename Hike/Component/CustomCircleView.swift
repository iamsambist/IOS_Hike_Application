//
//  CustomCircleView.swift
//  Hike
//
//  Created by MacBook Two on 18/11/2024.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient : Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight
                        ],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        }
        // Add animated content Top of Circle View
        .frame(width: 256, height: 256)
    }
}

// Gradient Color Animation

#Preview {
    CustomCircleView()
}
