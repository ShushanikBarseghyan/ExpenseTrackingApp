//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Shushan Barseghyan on 07.01.24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
  
    @EnvironmentObject var transactionListViewModel: TransactionListViewModel
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack (alignment: .leading, spacing: 24) {
          Text("Overview")
            .font(.title2)
            .bold()
          
          let data = transactionListViewModel.accumulateTransactions()
          
          if !data.isEmpty {
            let totalExpenses = data.last?.1 ?? 0
            CardView {
              VStack(alignment: .leading) {
                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                
                LineChart()
              }
                  .background(Color.systemBackground)
              
            }
            .data(data)
            .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.iconColor.opacity(0.4), Color.iconColor)))
            .frame(height: 300)
          }
         
          
          RecentTransactionListView()
        }
        .padding()
        .frame(maxWidth: .infinity)
      }
      .background(Color.backgroundColor)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem {
          Image(systemName: "bell.badge")
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.iconColor, .primary)
        }
      }
    }
    .navigationViewStyle(.stack)
    .accentColor(.iconColor)
  }
}

#Preview {
  Group {
    ContentView()
  }
  .environmentObject(transactionListViewModel)
}

