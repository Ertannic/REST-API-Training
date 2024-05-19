//
//  SearchBarViewModelDelegate.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 19.05.2024.
//

import Foundation

protocol SearchBarViewModelDelegate: AnyObject {
    
    func didTapSearchButton(withText searchText: String)
    
}

class SearchBarViewModel {
    weak var delegate: SearchBarViewModelDelegate?
    
    func handleSearchButtonTapped(searchText: String) {
        delegate?.didTapSearchButton(withText: searchText)
    }
}
