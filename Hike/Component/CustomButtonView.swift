//
//  CustomButtonView.swift
//  Hike
//
//  Created by MacBook Two on 18/11/2024.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(colors: [.white,.customGreenLight],
                    startPoint: .top,
                    endPoint: .bottom))
            
            Circle()
                .stroke(LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom),lineWidth: 4)
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                )
        }
        .frame(width: 58,height: 58)
    }
}

struct CustomButtonView_Preview : PreviewProvider {
    static var previews: some View{
        CustomButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
