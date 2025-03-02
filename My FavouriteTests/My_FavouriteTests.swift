//
//  My_FavouriteTests.swift
//  My FavouriteTests
//
//  Created by Minh Truong on 2/3/25.
//

@testable import My_Favourite
import XCTest

final class My_FavouriteTests: XCTestCase {
  struct Configuration {
    var storage: MockFoodUserDefaultStorage = .init([])
    var viewModel: FoodPlaceViewModel = .init()
  }

  private var config: Configuration = .init()

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  // MARK: - Test Case 1: ViewModel Decoding JSON Data Success

  func testViewModelDecodeJsonDataSuccess() {
    XCTAssertEqual(config.viewModel.getFoodPlaces().count, 4, "Error: Expected 4 food from extracting json data")
  }
  
  // MARK: - Test Case 2: Searching with Debounce Success in 0.5s

  func testSearchingDebounceSuccess() {
    let searchText = "LOTUS"
    
    // Run the searching debounce
    config.viewModel.searchingDebounce(searchText)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      XCTAssertEqual(
        self.config.viewModel.getFoodPlaces().filter { $0.name.localizedCaseInsensitiveContains(searchText) }.count,
        // Search data that returned by searchingDebounce
        self.config.viewModel.getSearchData().count,
        "Error: Expected the result of searching should be equaled"
      )
    }
  }
  
  // MARK: - Test Case 3: Toggle Like Success for Existing Food Places

  func testToggleLikeExistFoodPlaceSuccess() {
    // Add the food list of real view model to mock storage
    config.storage.addFoodList(config.viewModel.getFoodPlaces())
    
    // Get the first item for testing
    let firstFoodPlace = config.viewModel.getFoodPlaces().first!
    
    // Toogle like the food place item in MOCK store
    config.storage.toogleLike(firstFoodPlace)
    
    XCTAssertEqual(
      // Get the Food Place that has been toggled before
      config.storage.findFoodPlace(firstFoodPlace)?.isLike,
      // Toggle the real food place
      !firstFoodPlace.isLike,
      "Error: Expected toogle like for esxisting case should have the same value"
    )
  }
  
  // MARK: - Test Case 4: Toggle Like Success for Non-Existing Food Places

  func testToggleLikeNonExistFoodPlaceSuccess() {
    // Initialize new food place that should have isLike value as "False" - Default
    let secondFoodPlace = FoodPlace(id: 5, name: "New Food Place", address: "123 Nguyen Quang thang", imageName: "image-1",
                                    tags: ["test"], content: "test", isLike: false, coordinates: .init(longitude: 30.0, latitude: 40.0))
    
    // Toogle like the food place item in MOCK store
    config.storage.toogleLike(secondFoodPlace)
    
    XCTAssertEqual(
      // Get the Food Place that has been toggled before
      config.storage.findFoodPlace(secondFoodPlace)?.isLike,
      // Toggle the real food place
      !secondFoodPlace.isLike,
      "Error: Expected toogle like for non-esxisting case should have the same value"
    )
  }

  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    measure {
      // Put the code you want to measure the time of here.
    }
  }
}
