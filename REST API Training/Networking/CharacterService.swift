//
//  CharacterService.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 20.05.2024.
//

import Foundation
import Alamofire
import CryptoKit

class CharacterService {
    
    private let publicKey = "3493500d96bac8c2394fa0affa8c6f9a"
    private let privateKey = "dabd57b6d5d50b0db1b4e5f4fe95f510b0028b6f"
    private let baseURL = "https://gateway.marvel.com:443/v1/public/characters"
    
    func fetchCharacters(searchText: String, completion: @escaping (Result<[Character], Error>) -> Void) {
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = MD5(data: "\(timestamp)\(privateKey)\(publicKey)")
        let url = "\(baseURL)?ts=\(timestamp)&apikey=\(publicKey)&hash=\(hash)"
        
        AF.request(url).responseDecodable(of: APIResult.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result.data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}


