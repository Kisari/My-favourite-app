//
//  MenuSelectRow.swift
//  My Favourite
//
//  Created by Minh Trương on 31/07/2023.
//

import SwiftUI

struct FoodSelectRow: View {
  var item: FoodPlace
  var body: some View {
    HStack {
      item.image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: Constant.Spacing.xxLarge, height: Constant.Spacing.xxLarge)
        .clipShape(Circle())
        .padding(.trailing, Constant.Spacing.normal)
      VStack(alignment: .leading) {
        Text(item.name)
          .bold()
          .textCase(.uppercase)
        BadgeList(position: .leading, tags: item.tags)
      }
    }
  }
}

//struct MenuSelectRow_Previews: PreviewProvider {
//  static var previews: some View {
//    MenuSelectRow(item: foodTest)
//      .background(Color(.red))
//  }
//}
