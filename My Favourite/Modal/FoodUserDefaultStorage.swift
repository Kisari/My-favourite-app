//
//  UserDefaultFood.swift
//  My Favourite
//
//  Created by Minh Truong on 2/3/25.
//

import Foundation

class FoodUserDefaultStorage: FoodStorageProtocol {
  func toogleLike(_ foodPlace: FoodPlace) {
    //Get value from User Default
    let currentLikeStatus = UserDefaults.standard.bool(forKey: String(foodPlace.id))
     
    //Toggle Like
    UserDefaults.standard.set(!currentLikeStatus, forKey: String(foodPlace.id))
  }
}
