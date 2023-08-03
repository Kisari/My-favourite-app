//
//  ItemDetails.swift
//  My Favourite
//
//  Created by Minh Trương on 31/07/2023.
//

import SwiftUI

struct ItemDetails: View {
    var location: FoodPlace
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    NavigationLink(destination: MenuList()){
//                        HStack {
//                            Image(systemName: "chevron.backward")
//                            Text("Minh's food places")
//                        }
//                    }
//                }
//            }
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(location: FoodPlaces[0])
    }
}
