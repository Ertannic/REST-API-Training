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
        // Установка цвета фона кнопки в близкий к голубому синий
        button.backgroundColor = UIColor(red: 0.1, green: 0.5, blue: 1.0, alpha: 1.0)
        // Установка цвета иконки на кнопке в розовый
        button.tintColor = .red
        // Установка закругления для кнопки
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Properties
    var viewModel = SearchBarViewModel()
    var onSearchTextChange: ((String) -> Void)?
    
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
            make.trailing.equalTo(searchButton.snp.leading).offset(-10) // Отступ между textField и кнопкой
        }
        
        searchButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10) // Отступ справа для кнопки
            make.centerY.equalTo(searchBar) // Размещение кнопки по вертикали в центре textField
            make.height.width.equalTo(40) // Высота и ширина кнопки
        }
        
        // Добавляем красную обводку к кнопке
        searchButton.layer.borderWidth = 1
        searchButton.layer.borderColor = UIColor.red.cgColor
    }


    
    private func setupActions() {
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        searchBar.delegate = self
    }
    
    @objc private func searchButtonTapped() {
        print(searchBar.text ?? print("error"))
        print(viewModel)
        guard let searchText = searchBar.text else { return }
        viewModel.handleSearchButtonTapped(searchText: searchText)
    }
}

extension SearchBarView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Вызываем замыкание onSearchTextChange при изменении текста в поисковой строке
        onSearchTextChange?(searchText)
    }
}


