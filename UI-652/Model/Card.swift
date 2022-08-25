//
//  Card.swift
//  UI-652
//
//  Created by nyannyan0328 on 2022/08/25.
//

import SwiftUI

struct Card: Identifiable {
  var id = UUID().uuidString
    var cardImage : String
    var rotation : CGFloat = 0
}
