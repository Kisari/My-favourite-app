//
//  DebounceSearch.swift
//  My Favourite
//
//  Created by Minh Truong on 1/3/25.
//

import Foundation

class SearchDebouncer {
  private var runningItem: DispatchWorkItem?
  func debounce<T>(input: T, delay: TimeInterval, action: @escaping (T) -> Void) {
    // Cancel the previously running debounce task if any
    runningItem?.cancel()

    // Set up a new worker thread
    runningItem = DispatchWorkItem {
      action(input)
    }

    // Schedule the action to run after the delay
    guard let runningItem = runningItem else { return }

    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: runningItem)
  }
}
