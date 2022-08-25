//
//  Expence.swift
//  UI-652
//
//  Created by nyannyan0328 on 2022/08/25.
//

import SwiftUI

struct Expence: Identifiable {
    var id = UUID().uuidString
    var amountSpent : String
    var product : String
    var productIcon : String
    var spendType : String
    
}

var Expences: [Expence] = [
    Expence(amountSpent: "$18", product: "Youtube", productIcon: "Youtube", spendType: "Streaming"),
    Expence(amountSpent: "$128", product: "Amazon", productIcon: "Amazon", spendType: "Groceries"),
    Expence(amountSpent: "$28", product: "Apple", productIcon: "Apple", spendType: "Apple Pay"),
    Expence(amountSpent: "$9", product: "Patreon", productIcon: "Patreon", spendType: "Membership"),
    Expence(amountSpent: "$10", product: "Dribbble", productIcon: "Dribbble", spendType: "Membership"),
    Expence(amountSpent: "$100", product: "Instagram", productIcon: "Instagram", spendType: "Ad Publish"),
    Expence(amountSpent: "$55", product: "Netflix", productIcon: "Netflix", spendType: "Movies"),
    Expence(amountSpent: "$348", product: "Photoshop", productIcon: "Photoshop", spendType: "Editing"),
    Expence(amountSpent: "$99", product: "Figma", productIcon: "Figma", spendType: "Pro Member"),
]

