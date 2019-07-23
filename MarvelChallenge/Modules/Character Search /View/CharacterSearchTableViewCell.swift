//
//  CharacterSearchTableViewCell.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 18/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import UIKit

class CharacterSearchTableViewCell: UITableViewCell {

    var characterImageView: UIImageView!
    var nameLabel: UILabel!

    func configure(){
        
    }
}

extension CharacterSearchTableViewCell{
    
    private func initializeCell(){
        
        backgroundColor = .gray
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        characterImageView = UIImageView()
        characterImageView.contentMode = .scaleToFill
        
        nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 1
        
        addSubview(stackView)
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(characterImageView)
        stackView.addArrangedSubview(nameLabel)
        
        nameLabel.widthAnchor.constraint(equalTo: characterImageView.widthAnchor, multiplier: 9.0)
    }
}
