//
//  Character.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 19.05.2024.
//

import Foundation

struct Character: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: [String: String]
    var urls: [[String: String]]
}



