//
//  Item.swift
//  todoAPiMVVMPOP
//
//  Created by Swati Rout on 18/05/23.
//

import Foundation
struct Item: Codable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
}
