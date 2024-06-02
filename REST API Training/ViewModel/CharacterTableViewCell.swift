//
//  CharacterTableViewCell.swift
//  REST API Training
//
//  Created by Ertannic Saralay on 02.06.2024.
//

import UIKit
import SnapKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .systemRed
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .systemCyan
        return label
    }()
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(characterImageView)
        
        nameLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(200) // Set the height of the image view
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Configure Cell
    
    func configure(with character: Character) {
        nameLabel.text = character.name
        descriptionLabel.text = character.description.isEmpty ? "No description available" : character.description
        
        // Load image using Kingfisher
        if let thumbnail = character.thumbnail,
           let imagePath = thumbnail["path"],
           let ext = thumbnail["extension"],
           let imageURL = URL(string: "\(imagePath).\(ext)") {
            characterImageView.kf.setImage(with: imageURL)
        }
    }
}

extension Dictionary where Key == String, Value == String {
    func fullPath() -> String? {
        guard let path = self["path"], let ext = self["extension"] else {
            return nil
        }
        return "\(path).\(ext)"
    }
}

