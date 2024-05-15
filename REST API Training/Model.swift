//
//  Model.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 15.05.2024.
//

import Foundation
import Alamofire

struct TodoModel: Codable {
    var userId: Int
    var id: Int?
    var title: String
    var completed: Bool
}
let todoModel = TodoModel(userId: 159, title: "Задача на завтра", completed: false)


