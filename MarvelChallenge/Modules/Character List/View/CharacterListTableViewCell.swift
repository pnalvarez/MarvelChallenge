//
//  CharacterListTableViewCell.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 17/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterListTableViewCell: UITableViewCell {

    var thumbImageView: UIImageView!
    var nameLabel: UILabel!

    func configure(display: CharacterListDisplay){
    
        thumbImageView.sd_setImage(with: URL(string: display.thumb), completed: nil)
        nameLabel.text = display.name
    }
}

extension CharacterListTableViewCell{
    
    func initializeCell(){
        
        thumbImageView = UIImageView()
        thumbImageView.contentMode = .scaleToFill

        self.addSubview(thumbImageView)

        thumbImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        thumbImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thumbImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0).isActive = true
        thumbImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true

        nameLabel = UILabel()
        nameLabel.backgroundColor = .white
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 12.0)
        nameLabel.backgroundColor = .white
        nameLabel.textColor = .black
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.adjustsFontSizeToFitWidth = true

        self.addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 1.0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 1.0).isActive = true
    }
}
