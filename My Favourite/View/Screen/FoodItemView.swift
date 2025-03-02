//
//  MenuItemView.swift
//  My Favourite
//
//  Created by Minh Trương on 21/07/2023.
//

import CoreLocation
import SwiftUI

struct FoodItemView: View {
  @ObservedObject var viewModel: FoodPlaceViewModel
  let item: FoodPlace
  var body: some View {
    ZStack {
      NavigationStack {
        ScrollView {
          VStack {
            MapView(locationCoordinates: item.locationCoordinate, locationName: item.name)
              .frame(height: 500)

            Rectangle()
              .fill(Color("palette-4"))
              .cornerRadius(Constant.Spacing.normal)
              .frame(height: 400)
              .offset(y: -Constant.Spacing.normal)
              .overlay(
                VStack {
                  FoodCardItemHeader(item: item)
                  FoodCardItemDetail(viewModel: viewModel, item: item)
                },
                alignment: .top
              )
          }
        }
        .edgesIgnoringSafeArea(.all)
        .scrollDisabled(true)
      }
    }
  }

  private struct FoodCardItemHeader: View {
    var item: FoodPlace
    var body: some View {
      CustomImage(image: item.imageName, shape: "Circle")
        .offset(y: -Constant.Spacing.big)
        .padding(.bottom, -Constant.Spacing.big)

      VStack {
        Text(item.name)
          .font(.system(size: Constant.Spacing.normal))
          .bold()
          .foregroundColor(.white)

        Text(item.address)
          .font(.system(size: Constant.Spacing.xMedium))
          .foregroundColor(.white)
      }
      .padding(.bottom, Constant.Spacing.normal)
    }
  }

  private struct FoodCardItemDetail: View {
    @ObservedObject var viewModel: FoodPlaceViewModel
    var item: FoodPlace
    var body: some View {
      VStack {
        InfoRow(title: "Walking time", content: "1 hour 35 mins")

        InfoRow(title: "Distance", content: "123 m")
      }

      NavigationLink(destination: FoodItemDetailView(viewModel: viewModel, item: item)
        .navigationBarBackButtonHidden(true))
      {
        Text("Explore")
          .frame(width: 300, height: 50)
          .background(Color(.red))
          .foregroundColor(.white)
          .bold()
          .clipShape(RoundedRectangle(cornerRadius: Constant.Spacing.xMedium, style: .continuous))
      }
      .padding(.top, Constant.Spacing.normal)
    }
  }
}

struct MenuItem_Previews: PreviewProvider {
  
  static var previews: some View {
    @StateObject var viewModel = FoodPlaceViewModel()
    
    FoodItemView(viewModel: viewModel, item: foodTest)
  }
}
