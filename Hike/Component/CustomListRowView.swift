//
//  CustomListRowView.swift
//  Hike
//
//  Created by MacBook Two on 18/11/2024.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    
    @State var rowLabel : String
    @State var rowIcon : String
    @State var rowContent : String? = nil
    @State var rowTintColor : Color
    @State var rowLinkLabel : String? = nil
    @State var rowLinkDestination : String? = nil
    var body: some View {
        // 2. Advanced Labeled Content
        LabeledContent {
            // Content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }else if (rowLinkLabel != nil && rowLinkDestination != nil ){
                Link(rowLinkLabel!,destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
                
            }
             else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            // label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30,height: 30)
                        .foregroundColor(rowTintColor)
                    
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
                
            }
        }

    }
}

struct CustomListRowView_Preview : PreviewProvider{
    static var previews: some View{
        List {
            CustomListRowView(rowLabel: "Webiste", rowIcon: "globe", rowContent: nil, rowTintColor: .pink, rowLinkLabel: "Google",
                              rowLinkDestination: "https://google.com")
        }
    }
}
