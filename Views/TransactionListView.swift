//
//  TransactionListView.swift
//  ExpenseTracker
//
//  Created by Shushan Barseghyan on 08.01.24.
//

import SwiftUI

struct TransactionListView: View {
  @EnvironmentObject var transactionListViewModel: TransactionListViewModel

    var body: some View {
      VStack {
        List {
          ForEach(Array(transactionListViewModel.groupTransactiosByMonth()), id: \.key) { month, transactions in
            
            Section {
              ForEach(transactions) { transaction in
                TransactionRowView(transaction: transaction)
              }
            } header: {
              Text(month)
            }
            .listSectionSeparator(.hidden)
          }
        }
        .listStyle(.plain)
      }
      .navigationTitle("Transactions")
      .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
  NavigationView {
    TransactionListView()
      .environmentObject(transactionListViewModel)
  }
}
