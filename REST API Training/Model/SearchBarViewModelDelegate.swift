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
    
    func handleSearchButtonTapped(searchText: String) {
        characterService.fetchCharacters(searchText: searchText) { result in
            switch result {
            case .success(let characters):
                self.characters = characters
            case .failure(let error):
                print("Error fetching characters: \(error)")
            }
        }
    }
}



