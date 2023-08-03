//
//  MenuList.swift
//  My Favourite
//
//  Created by Minh Trương on 20/07/2023.
//

import SwiftUI

//extension View {
//    func navigationBarTitleText(_ fontFamily: String, _ inputSize: CGFloat,_ color: Color) ->
//    some View{
//        let uiFamily = UIFont(name: fontFamily, size: inputSize)
//        let uiColor = UIColor(color)
//        UINavigationBar.appearance().largeTitleTextAttributes = [.font: uiFamily!, .foregroundColor: uiColor, .tracking: 20]
//        UINavigationBar.appearance().titleTextAttributes = [.font: uiFamily!, .foregroundColor: uiColor, .tracking: 20]
//        return self
//    }
//}

struct MenuList: View {
//    @State var selection: Int = 0;
    var body: some View {
        NavigationView(){
            List(FoodPlaces){ item in
                NavigationLink{
                    MenuItem(location: item)
                } label: {
                    MenuSelectRow(location: item)
                }
            }.navigationTitle("Minh's food places")
        }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}



