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
    
    private func initializeCell(){
        
        thumbImageView = UIImageView()
        
        self.addSubview(thumbImageView)
        
        thumbImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: thumbImageView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: thumbImageView, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: thumbImageView, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: thumbImageView, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        
        nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18.0)
        nameLabel.backgroundColor = .white
        nameLabel.textColor = .black
        
        thumbImageView.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: thumbImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: thumbImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: thumbImageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.4, constant: 0.0).isActive = true
        NSLayoutConstraint(item: thumbImageView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.2, constant: 0.0).isActive = true
    }
}
