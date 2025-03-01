//
//  FoodPlaceViewModel.swift
//  My Favourite
//
//  Created by Minh Truong on 24/2/25.
//

import Combine
import Foundation

// must be class because we need change the property or data
class FoodPlaceViewModel: ObservableObject {
  struct Configuration {
    var filename: String = "MockData.json"
    var searchingDelaytime: Double = 0.5
    var searchingDebouncer: SearchDebouncer = .init()
  }

  private var config: Configuration
  @Published var foodPlaces: [FoodPlace] = .init()
  @Published var searchData: [FoodPlace] = .init()
  @Published var isLoading: Bool = false
  @Published var searchInput: String = "" {
    didSet {
      searchingDebounce(searchInput)
    }
  }

  init() {
    // Initialize the config
    config = Configuration()

    // Getting stored data from json file
    foodPlaces = decodeJsonData()
  }

  private func decodeJsonData<T: Decodable & Collection>() -> T where T.Element: Identifiable {
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
      var decodedObject = try decoder.decode(T.self, from: data)

      return decodeUserDefault(&decodedObject)

    } catch {
      fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
  }

  // Decode from User Default to get like/unlike value
  private func decodeUserDefault<T: Decodable & Collection>(_ decodedObject: inout T) -> T where T.Element: Identifiable {
    let mapped = decodedObject.map { item in
      var item = item
      let idString = String(describing: item.id)

      if let isLike = UserDefaults.standard.value(forKey: idString) as? Bool {
        if var foodPlace = item as? FoodPlace {
          foodPlace.isLike = isLike
          item = foodPlace as! T.Element
        }
      }
      return item
    }

    return mapped as! T
  }

  // Searching debounce
  private func searchingDebounce(_ searchingText: String) {
    isLoading = true
    config.searchingDebouncer.debounce(input: searchingText, delay: config.searchingDelaytime) { [weak self] debouncedText in
      guard let self = self else {
        fatalError("Something wrong when trying to search | searchingDebounce() ")
      }
      self.searchData = self.searchingResult(debouncedText)
      self.isLoading = false
    }
  }

  // Searching function
  public func searchingResult(_ searchingText: String) -> [FoodPlace] {
    if !searchingText.isEmpty {
      return foodPlaces.filter { $0.name.localizedCaseInsensitiveContains(searchingText) }
    }
    return foodPlaces
  }

  // Toggle like/unlike
  public func toggleLike(for foodPlace: FoodPlace) {
    if let index = foodPlaces.firstIndex(where: { $0.id == foodPlace.id }) {
      foodPlaces[index].isLike.toggle()
      UserDefaults.standard.set(foodPlaces[index].isLike, forKey: String(foodPlaces[index].id))
    }
  }
}

var foodTest: FoodPlace = .init(id: 3, name: "test", address: "asdasd", imageName: "image-1", tags: ["badge1", "badge2"], content: "this is just a test", isLike: false, coordinates: Coordinates(longitude: 106.683830, latitude: 21.865139))
