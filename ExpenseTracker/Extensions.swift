//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Shushan Barseghyan on 07.01.24.
//

import Foundation
import SwiftUI


extension Color {
  static let backgroundColor = Color("Background")
  static let iconColor = Color("Icon")
  static let textColor = Color("Text")
  static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
  static let allNumericUSA: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    
    return formatter
  }()
}


extension String {
  func dateParsed() -> Date {
    guard let parsedDate = DateFormatter.allNumericUSA.date(from:
                                                              self)
    else {
      return Date()
    }
    return parsedDate
  }
}
  
  extension Date {
    func formatted() -> String {
      return self.formatted(.dateTime.year().month().day())
    }
}

extension Double {
  func roundedToTwoDigits() -> Double {
    return (self *  100).rounded() / 100
  }
}
