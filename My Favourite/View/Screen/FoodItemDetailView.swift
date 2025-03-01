//
//  ItemDetailView.swift
//  My Favourite
//
//  Created by Minh Trương on 31/07/2023.
//

import SwiftUI

// fileprivate same as private (at file level)
struct FoodItemDetailView: View {
  @ObservedObject var viewModel: FoodPlaceViewModel
  @State var toggleLike: Bool = false
  
  var item: FoodPlace
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: Constant.Spacing.xSmall) {
        FoodItemTitleSection(viewModel: viewModel, isClicked: $toggleLike, item: item)
        FoodItemDetailSection(item: item)
      }
    }
    .frame(maxWidth: Constant.Style.viewWidth, maxHeight: Constant.Style.viewHeight, alignment: .top)
    .cornerRadius(Constant.Spacing.xMedium)
  }
  
  private struct FoodItemTitleSection: View {
    @ObservedObject var viewModel: FoodPlaceViewModel
    @Binding var isClicked: Bool
    var item: FoodPlace
    var body: some View {
      VStack {
        CustomImage(image: item.imageName, shape: "Rectangle")
        HStack {
          VStack(alignment: .leading) {
            Text(item.name)
              .bold()
              .font(.system(size: Constant.Spacing.xNormal))

            Text(item.address)
              .fontWeight(.light)
              .font(.subheadline)
          }
          Spacer()
          HStack {
            Button(action: {}, label: {
              Image(systemName: "arrowshape.turn.up.forward.fill")
            })
            .font(.system(size: Constant.Spacing.normal))
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
          }
        }
        VStack(alignment: .leading) {
          BadgeList(position: .trailing, tags: item.getFoodTags())
        }
      }
      .padding(.horizontal, Constant.Spacing.small)
    }
  }

  private struct FoodItemDetailSection: View {
    var item: FoodPlace
    var body: some View {
      VStack(alignment: .leading) {
        Text("Details")
          .bold()
          .font(.system(size: Constant.Spacing.xNormal))
        Text(item.content)
          .font(.system(size: Constant.Spacing.normal))
          .fontWeight(.regular)
      }
      .padding(.horizontal, Constant.Spacing.xMedium)
    }
  }
}

//struct FoodItemDetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    FoodItemDetailView(item: foodTest)
//  }
//}
