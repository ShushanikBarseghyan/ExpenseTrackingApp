//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Shushan Barseghyan on 07.01.24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
  @StateObject var transactionListViewModel = TransactionListViewModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(transactionListViewModel)
    }
  }
}
