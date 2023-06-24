//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Fraidoon Pourooshasb on 6/20/23.
//

import SwiftUI


struct ContentView: View {
    
@StateObject var expenses = Expenses()
@State private var showingAddExpense = false

    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.cyan,.orange], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                List {
                    ForEach(expenses.items){ item in
                        if item.amount < 10 {
                            Text("\(item.name)  | \(item.type)  | $ \(item.amount.formatted())").foregroundColor(Color.red)
                        } else if item.amount < 100 {
                            Text("\(item.name)  | \(item.type)  | $ \(item.amount.formatted())").foregroundColor(Color.blue)
                        } else {
                            Text("\(item.name)  | \(item.type)  | $ \(item.amount.formatted())").foregroundColor(Color.black
                            )
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationTitle("EXPENSES")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton().foregroundColor(.primary).bold()
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            expenses.items.removeAll()
                            
                        } label: {
                            Text("Delete All").foregroundColor(.primary).bold()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus").foregroundColor(.primary).bold()
                    }
                    }
                }
                .sheet(isPresented: $showingAddExpense, content: {
                    AddView(expenses: expenses)
                })
            }
            .scrollContentBackground(.hidden)
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
