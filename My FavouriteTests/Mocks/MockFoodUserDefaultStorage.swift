//
//  Mocktest.swift
//  My FavouriteTests
//
//  Created by Minh Truong on 2/3/25.
//

import Foundation
@testable import My_Favourite

class MockFoodUserDefaultStorage: FoodStorageProtocol {
  private var foodList: [FoodPlace] = .init()

  init(_ foodList: [FoodPlace]) {
    self.foodList = foodList
  }
  
  func addFoodList(_ foodPlace: [FoodPlace]) {
      foodList.append(contentsOf: foodPlace)
  }

  func findFoodPlace(_ foodPlace: FoodPlace) -> FoodPlace? {
    return foodList.first(where: { $0.id == foodPlace.id })
  }

  //Simulate the User Default storage
  func toogleLike(_ foodPlace: FoodPlace) {
    if let foodItem = findFoodPlace(foodPlace) {
      // toggle like
      updateNewFoodPlace(foodItem)
    }
    else {
      // all food are set by "unlike" if not in database -> first click change unlike to like
      addNewFoodPlace(foodPlace)
    }
  }

  private func updateNewFoodPlace(_ foodPlace: FoodPlace) {
    guard let index = foodList.firstIndex(where: { $0.id == foodPlace.id }) else { return }
    foodList[index].isLike.toggle()
  }

  private func addNewFoodPlace(_ foodPlace: FoodPlace) {
    var newFoodPlace = foodPlace
    newFoodPlace.isLike = true
    foodList.append(newFoodPlace)
  }
}
