//
//  PreviewData.swift
//  FinanceTrackingApp
//
//  Created by Shushan Barseghyan on 07.01.24.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/24/2024", institution: "Bank", account: "Visa", merchant: "Apple", amount: 20.0, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPfreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
