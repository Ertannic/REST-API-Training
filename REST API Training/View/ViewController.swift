//
//  ViewController.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 15.05.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "CharacterCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    let searchBarView = SearchBarView()
    let searchBarViewModel = SearchBarViewModel()
    
    // MARK: - UI
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Marvel"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        setupViews()
        setupConstraints()
        setupSearchBar()
    }
    
    private func setupViews() {
        view.addSubview(searchBarView)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        searchBarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBarView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupSearchBar() {
        searchBarView.viewModel = searchBarViewModel
        searchBarView.onSearchButtonTapped = { [weak self] searchText in
            self?.searchBarViewModel.fetchCharacters(searchText: searchText) { _ in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - Extensions

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchBarViewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableViewCell
        let character = searchBarViewModel.characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
}

