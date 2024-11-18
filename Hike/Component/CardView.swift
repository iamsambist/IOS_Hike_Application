//
//  CardView.swift
//  Hike
//
//  Created by MacBook Two on 18/11/2024.
//

import SwiftUI

struct CardView: View {
    // MARK : - PROPERTIES
    
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 1
    @State private var isShowingSheet : Bool = false
    
    // MARK : - FUNCTIONS
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        
        // MARK: - CARD
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // Mark: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                colors: [.customGrayLight,.customGrayMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                            )
                        Spacer()
                        Button {
                            // ACTION : SHOW A SHEET
                            isShowingSheet.toggle()
                            
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for frieds and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                // MARK: - HEADER END
                .padding(.horizontal,30)
                
                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default,value:imageNumber)
                }
                // MARK : - FOOTER 
                Button {
                    // Action : Generate a Random Number
                    randomImage()
                    
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: .black, radius: 0.25)
                }
                .buttonStyle(GreadientButton())

            }
        } // : CARD
        .frame(width: 320,height: 570)
    }
}

#Preview {
    CardView()
}
