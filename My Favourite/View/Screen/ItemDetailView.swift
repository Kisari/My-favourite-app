//
//  ItemDetailView.swift
//  My Favourite
//
//  Created by Minh Trương on 31/07/2023.
//

import SwiftUI

struct ItemDetails: View {
    @State var isClicked: Bool = false
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
                        .font(.system(size: Constant.Spacing.large))
                }
                Spacer()
                HStack {
                  Button(action: {
                  }, label: {
                    Image(systemName: "arrowshape.turn.up.forward.fill")
                  })
                  .font(.system(size: Constant.Spacing.normal))
                  Button(action: {
                    isClicked = !isClicked
                  }, label: {
                    isClicked ?
                    Image(systemName: "heart.fill")
                    :
                    Image(systemName: "heart")
                  })
                  .font(.system(size: Constant.Spacing.normal))
                  .foregroundColor(.red)
                }
            }
          VStack (alignment: .leading){
                  Text(item.address)
                      .fontWeight(.light)
                      .font(.subheadline)
                  BadgeList(position: .trailing, tags: item.getFoodTags())
              }
            
            VStack(alignment: .leading){
              Text("Details")
                .bold()
                .font(.system(size: Constant.Spacing.large))
              Text(item.content)
                .font(.system(size: Constant.Spacing.normal))
                .fontWeight(.regular)
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
