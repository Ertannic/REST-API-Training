//
//  Image.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 26.05.2024.
//

import Foundation

struct Image: Codable {
    var path: String?
    var `extension`: String?

    enum CodingKeys: String, CodingKey {
        case path
        case `extension` = "extension"
    }

    func fullPath() -> String? {
        guard let path = path, let ext = `extension` else {
            return nil
        }
        return "\(path).\(ext)"
    }
}
