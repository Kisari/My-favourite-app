//
//  ItemDetailView.swift
//  My Favourite
//
//  Created by Minh Trương on 31/07/2023.
//

import SwiftUI

struct ItemDetails: View {
    var item: FoodPlace
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .center) {
                    CustomImage(image: item.imageName, shape: "Rectangle")
                }
                HStack(spacing: 8) {
                    VStack {
                        Text(item.name)
                            .bold()
                            .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
                    }
                    HStack {
                        BadgeList(position: .trailing, tags: item.getFoodTags())
                    }
                }
                VStack {
                    Text(item.address)
                        .fontWeight(.light)
                        .font(.subheadline)
                }
            }
            .padding(.all, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.vertical, 12)
        .cornerRadius(20)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(item: foodTest)
    }
}
