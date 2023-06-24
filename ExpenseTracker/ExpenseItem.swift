//
//  ExpenseItem.swift
//  ExpenseTracker
//
//  Created by Fraidoon Pourooshasb on 6/20/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
}
