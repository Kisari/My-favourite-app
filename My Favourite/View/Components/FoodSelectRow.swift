//
//  MenuSelectRow.swift
//  My Favourite
//
//  Created by Minh Trương on 31/07/2023.
//

import SwiftUI

struct FoodSelectRow: View {
  @ObservedObject var viewModel: FoodPlaceViewModel
  @State var isClicked: Bool = false
  
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
      
      Spacer()
      
      Button(action: {
        isClicked = !item.isLike
        viewModel.toggleLike(for: item)
      }, label: {
        item.isLike ?
          Image(systemName: "heart.fill")
          :
          Image(systemName: "heart")
      })
      .font(.system(size: Constant.Spacing.normal))
      .foregroundColor(.red)
      .buttonStyle(PlainButtonStyle()) 
    }
  }
}

struct MenuSelectRow_Previews: PreviewProvider {
  static var previews: some View {
    @StateObject var viewModel = FoodPlaceViewModel()
    
    
    FoodSelectRow(viewModel: viewModel, item: foodTest)
  }
}
