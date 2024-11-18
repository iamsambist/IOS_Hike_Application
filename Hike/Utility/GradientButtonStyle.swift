//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by MacBook Two on 18/11/2024.
//

import Foundation
import SwiftUI

struct GreadientButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement with Nil Coalescing
                // Conditon ? A : B
                configuration.isPressed ?
                // A  : When User Pressed the Button
                LinearGradient(colors: [.customGrayMedium,.customGrayLight], startPoint: .top, endPoint: .bottom)
                // B : When the Button is not Pressed
                :
                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                
            )
            .cornerRadius(40) 
    }
}
