//
//  Networking.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 15.05.2024.
//

import Foundation

// Подготовка и проверка URL
let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
guard let requestUrl = url else {
    fatalError("URL не рабочий")
}

// Подготовка объекта URLRequest к запросу
var request = URLRequest(url: requestUrl)
request.httpMethod = "POST"

// Параметры запроса
let postString = "userID=159&title=Задача на завтра&completed =false"

// Тело запроса
request.httpBody = postString.data(using: String.Encoding.utf8)

// Выполнение HTTP запроса
let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

    // Проверяем на наличие ошибок
    if let error = error {
        print("Error took place \(error)")
        return
    }
    
    // Конваертируем полученную data в String
    if let data = data, let dataString = String(data: data, encoding: .utf8) {
        print("Response data string:\n \(dataString)")
    }
}
task.resume()
