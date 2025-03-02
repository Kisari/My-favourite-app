//
//  MenuListView.swift
//  My Favourite
//
//  Created by Minh Trương on 20/07/2023.
//

import SwiftUI

struct FoodListView: View {
  @StateObject var viewModel = FoodPlaceViewModel()

  var body: some View {
    NavigationView {
      ZStack {
        Color(.systemGray6)
          .ignoresSafeArea()
        VStack {
          if viewModel.isLoading && viewModel.searchInput.isEmpty {
            ProgressView("Loading...")
              .progressViewStyle(CircularProgressViewStyle())
              .padding()
              .frame(maxWidth: Constant.Style.viewWidth, maxHeight: Constant.Style.viewHeight)
          } else {
            List(viewModel.searchInput.isEmpty ? viewModel.foodPlaces : viewModel.searchData) { item in
              NavigationLink {
                FoodItemView(viewModel: viewModel, item: item)
              } label: {
                FoodSelectRow(viewModel: viewModel, item: item)
              }
            }
          }
        }
        .navigationTitle("Minh's food places")
      }
      .searchable(text: $viewModel.searchInput,
                  placement: .navigationBarDrawer(displayMode: .always),
                  prompt: "Looking for places")
    }
  }
}

struct MenuList_Previews: PreviewProvider {
  static var previews: some View {
    FoodListView()
  }
}
