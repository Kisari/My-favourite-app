//
//  FoodPlaceViewModel.swift
//  My Favourite
//
//  Created by Minh Truong on 24/2/25.
//

import Foundation


//must be class because we need change the property or data
class FoodPlaceViewModel: ObservableObject {
  struct Configuration {
    var filename: String = "MockData.json"
  }

  private var config: Configuration
  @Published var foodPlaces: [FoodPlace] = .init()
  @Published var searchInput = ""

  init() {
    config = Configuration()
    foodPlaces = decodeJsonData()
  }

  private func decodeJsonData<T: Decodable>() -> T {
    let filename = config.filename
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
      fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
      data = try Data(contentsOf: file)
    } catch {
      fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
    } catch {
      fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
  }

  public func searchingResult() -> [FoodPlace] {
    if !searchInput.isEmpty {
      return foodPlaces.filter { $0.name.localizedCaseInsensitiveContains(searchInput) }
    }
    return foodPlaces
  }
}

var foodTest: FoodPlace = .init(id: 3, name: "test", address: "asdasd", imageName: "image-1", tags: ["badge1", "badge2"], content: "this is just a test", coordinates: Coordinates(longitude: 106.683830, latitude: 21.865139))
