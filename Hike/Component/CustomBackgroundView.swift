//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by MacBook Two on 18/11/2024.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK : - 3. DEPTH
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y:12)
            
            // MARK : - 2. LIGHT
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.9)
            
            // MARK : - 1. SURFACE
            
            LinearGradient(
                colors:[.customGreenLight,.customGreenMedium],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

struct CustomBackgroundView_Preview : PreviewProvider {
    static var previews: some View{
        CustomBackgroundView()
            .padding()
    }
}
