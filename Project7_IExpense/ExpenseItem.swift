//
//  ExpenseItim.swift
//  Project7_IExpense
//
//  Created by admin on 16.08.2022.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
