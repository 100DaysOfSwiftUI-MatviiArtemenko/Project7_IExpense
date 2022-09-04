//
//  AddView.swift
//  Project7_IExpense
//
//  Created by admin on 16.08.2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    let types = ["Personal", "Buisness"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                }
                Section {
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section {
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                Button {
                    let newExpense = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(newExpense)
                    dismiss()
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
