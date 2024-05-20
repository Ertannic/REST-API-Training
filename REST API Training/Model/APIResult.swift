//
//  APIResult.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 20.05.2024.
//

import Foundation

struct APIResult: Codable {
    var data: APICharacterData
}

struct APICharacterData: Codable {
    var count: Int
    var results: [Character]
}


