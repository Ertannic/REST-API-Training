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
    weak var delegate: SearchBarViewModelDelegate?
    
    func handleSearchButtonTapped(searchText: String) {
        print("Search button tapped with text: \(searchText)")
        characterService.fetchCharacters(searchText: searchText) { result in
            switch result {
            case .success(let characters):
                if characters.isEmpty {
                    self.delegate?.searchFailed()
                } else {
                    self.characters = characters
                }
            case .failure(let error):
                print("Error fetching characters: \(error)")
            }
        }
    }
}


