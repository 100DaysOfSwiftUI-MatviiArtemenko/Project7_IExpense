//
//  ContentView.swift
//  Project7_IExpense
//
//  Created by admin on 16.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showAddView = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(expenses.items) { item in
                        
                        if item.type == "Personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(.black)
                                    .padding(5)
                                    .padding(.horizontal)
                                    .background(setColor(amount: item.amount))
                                    .cornerRadius(10)
                            }
                        } else {}
                    }
                    .onDelete(perform: deleteFromList)
                } header: {
                    Text("Personal")
                }
                Section {
                    ForEach(expenses.items) { item in
                        if item.type == "Buisness" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(.black)
                                    .padding(5)
                                    .padding(.horizontal)
                                    .background(setColor(amount: item.amount))
                                    .cornerRadius(10)
                            }
                        } else { }
                    }
                    .onDelete(perform: deleteFromList)
                    
                } header: {
                    Text("Buisness")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                
                Button {
                    showAddView = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .sheet(isPresented: $showAddView) {
                    AddView(expenses: expenses)
                }
            }
        }
    }
    
    func deleteFromList(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func setColor(amount: Double) -> Color  {
        var color = Color.cyan
        switch amount {
        case 0...49 :
            color = Color.mint
        case 50...199 :
            color = Color.yellow
        case 200...1000 :
            color = Color.purple
        default :
            color = Color.red
        }
        return color
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
