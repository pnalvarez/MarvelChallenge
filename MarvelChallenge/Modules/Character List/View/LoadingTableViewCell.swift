//
//  LoadingTableViewCell.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 18/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    
    var activityIndicator: UIActivityIndicatorView!
    
    func configure(){
        
        activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.backgroundColor = .gray
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        
        addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalToSystemSpacingBelow: centerYAnchor, multiplier: 1.0).isActive = true
        activityIndicator.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0).isActive = true
        activityIndicator.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
    }

}
