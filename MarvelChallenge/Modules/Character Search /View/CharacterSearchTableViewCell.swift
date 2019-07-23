//
//  CharacterSearchTableViewCell.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 18/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterSearchTableViewCell: UITableViewCell {

    var characterImageView: UIImageView!
    var nameLabel: UILabel!
    
    var display: CharacterListDisplay?

    func configure(display: CharacterListDisplay){
        
        self.display = display
        
        characterImageView.sd_setImage(with: URL(string: display.thumb), completed: nil)
        nameLabel.text = display.name
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
        nameLabel.textColor = .white
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15.0)
        
        addSubview(stackView)
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(characterImageView)
        stackView.addArrangedSubview(nameLabel)
        
        nameLabel.widthAnchor.constraint(equalTo: characterImageView.widthAnchor, multiplier: 9.0).isActive = true
    }
}
