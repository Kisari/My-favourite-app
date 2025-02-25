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
          VStack(alignment: .leading, spacing: Constant.Spacing.xSmall) {
                VStack(alignment: .center) {
                    CustomImage(image: item.imageName, shape: "Rectangle")
                }
                HStack(spacing: Constant.Spacing.small) {
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
            .padding(.all, Constant.Spacing.small)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.vertical, Constant.Spacing.xSmall)
        .cornerRadius(Constant.Spacing.xMedium)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(item: foodTest)
    }
}
