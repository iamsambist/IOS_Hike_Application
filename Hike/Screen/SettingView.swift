//
//  SettingView.swift
//  Hike
//
//  Created by MacBook Two on 18/11/2024.
//

import SwiftUI

struct SettingView: View {
    // MARK: - PROPERTIES
    private let alternateAppIcons : [String] = ["AppIcon-Backpack","AppIcon-Camera","AppIcon-Campfire","AppIcon-magnify","AppIcon-Map","AppIcon-Mushroom"]
    var body: some View {
        List {
            // MARK: - SECTION HEADER
            Section {
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    VStack (spacing : -10){
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGrayLight,.customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top,8)
                VStack (spacing:8){
                    
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even beeter once you are actually there. The hike that you hope to do again someday. \nFined the best day hikes in the appp.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! it's time to walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom)
    
            }
            .listRowSeparator(.hidden)
            // END: HEADER

            // MARK: - SECTION ICONS
            
            Section(header: Text("Alternate Icons")){
                ScrollView(.horizontal,showsIndicators: false){
                    HStack (spacing: 12){
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button{
                                print("Icon \(item) Pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){
                                    error in
                                    if error != nil {
                                        print("Failed request to update an App Icon:\(String(describing : error?.localizedDescription))")
                                    }else{
                                        print("Sucess! You have Changed the app Icon")
                                    }
                                    
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
        // list view won't seamlessy work with button so add this
                } //: SCROLL VIEW
                .padding(.top,12)
                Text("Choose your favourite app icon from the collection above")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
            } //: SECTION
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION ABOUT
            
            Section (
                header: Text("About The Application"),
                footer: HStack{
                    Spacer()
                    Text("Copyright @ All right reserved.")
                    Spacer()
                }
                    .padding(.vertical,8)
            ){
                // 1. Advance labeled Content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPadOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Sam", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Alice", rowTintColor: .pink)
                CustomListRowView(rowLabel: "Webiste", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Google", rowLinkDestination: "https://google.com")
                
                
            } //: Section
            
        } //: LIST
    }
}

#Preview {
    SettingView()
}
