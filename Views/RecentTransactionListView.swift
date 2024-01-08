//
//  RecentTransactionListView.swift
//  ExpenseTracker
//
//  Created by Shushan Barseghyan on 08.01.24.
//

import SwiftUI

struct RecentTransactionListView: View {
  
  @EnvironmentObject var transactionListViewModel: TransactionListViewModel
  
  var body: some View {
    VStack{
      HStack{
        Text("Recent Transactions")
          .bold()
        
        Spacer()
        
        NavigationLink {
          TransactionListView()
        } label: {
          HStack(spacing: 4) {
            Text("See All")
            Image(systemName: "chevron.right")
          }
          .foregroundStyle(Color.textColor)
        }
      }
      .padding()
      
      ForEach(Array(transactionListViewModel.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
        TransactionRowView(transaction: transaction)
        
        Divider()
          .opacity(index == 4 ? 0 : 1)
      }
      
    }
    .padding()
    .background(Color.systemBackground)
    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
  }
}


let transactionListViewModel: TransactionListViewModel = {
  let transactionListViewModel = TransactionListViewModel()
  transactionListViewModel.transactions = transactionListPfreviewData
  return transactionListViewModel
}()

#Preview {
  RecentTransactionListView()
    .environmentObject(transactionListViewModel)
}
