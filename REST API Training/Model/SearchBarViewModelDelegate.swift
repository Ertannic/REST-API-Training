//
//  SearchBarViewModelDelegate.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 19.05.2024.
//

import Foundation

class SearchBarViewModel {
    private let characterService = CharacterService()
    var characters: [Character] = []
    
    func fetchCharacters(searchText: String, completion: @escaping (Result<[Character], Error>) -> Void) {
        characterService.fetchCharacters(searchText: searchText) { result in
            switch result {
            case .success(let characters):
                self.characters = characters
                completion(.success(characters))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


