//
//  MenuListView.swift
//  My Favourite
//
//  Created by Minh Trương on 20/07/2023.
//

import SwiftUI

struct MenuList: View {
  @ObservedObject var viewModel = FoodPlaceViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.searchingResult()) { item in
                NavigationLink {
                    MenuItem(item: item)
                } label: {
                    MenuSelectRow(item: item)
                }
            }
            .navigationTitle("Minh's food places")
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .searchable(text: $viewModel.searchInput,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Looking for places")
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}
