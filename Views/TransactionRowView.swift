//
//  TransactionRowView.swift
//  ExpenseTracker
//
//  Created by Shushan Barseghyan on 07.01.24.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRowView: View {
  var transaction: Transaction
  
  var body: some View {
    HStack(spacing: 20) {
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .fill(Color.iconColor.opacity(0.3))
        .frame(width: 44, height: 44)
        .overlay {
          FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.iconColor)
        }
      
      VStack (alignment: .leading, spacing: 6) {
        Text(transaction.merchant)
          .font(.subheadline)
          .bold()
          .lineLimit(1)
        
        Text(transaction.category)
          .font(.footnote)
          .opacity(0.7)
          .lineLimit(1)
        
        Text(transaction.dateParsed, format: .dateTime.year().month().day())
          .font(.footnote)
          .foregroundStyle(.secondary)
      }
      Spacer()
      
      Text(transaction.signedAmount, format: .currency(code: "USD"))
        .bold()
        .foregroundStyle(transaction.type == TransactionType.credit.rawValue ? Color.textColor : Color.primary)
    }
    .padding(.horizontal, 8)
  }
}

#Preview {
  TransactionRowView(transaction: transactionPreviewData)
}
