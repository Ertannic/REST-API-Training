//
//  SearchBarView.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 19.05.2024.
//

import UIKit
import SnapKit

class SearchBarView: UIView {
    
    // MARK: - Outlets
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        // Установка цвета фона для поисковой строки в красный
        searchBar.barTintColor = .red
        // Установка цвета текста для поисковой строки в черный
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = .black
            // Установка цвета обводки и закругление для textField
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 10
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.red.cgColor
        }
        return searchBar
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        return button
    }()
    
    // MARK: - Views
    var viewModel: SearchBarViewModel?
    
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupActions()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    private func setupUI() {
        addSubview(searchBar)
        addSubview(searchButton)
        
        searchBar.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(searchButton.snp.leading)
        }
        
        searchButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(50)
        }
    }
    
    private func setupActions() {
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc private func searchButtonTapped() {
        guard let searchText = searchBar.text else { return }
        viewModel?.handleSearchButtonTapped(searchText: searchText)
    }
}
