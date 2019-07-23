//
//  DetailsViewController.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 23/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    var mainStackView: UIStackView!
    var characterImageView: UIImageView!
    var characterNameLabel: UILabel!
    var characterDescriptionLabel: UILabel!
    
    var presenter: DetailsPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = .blue
        
        initializeStackViews()
        initializeImageView()
        initializeLabels()
        
        presenter?.viewDidLoad()
    }
}

extension DetailsViewController{
    
    private func initializeStackViews(){
        
        mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        
        view.addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func initializeImageView(){
        
        characterImageView = UIImageView()
        characterImageView.contentMode = .scaleToFill
        
        mainStackView.addArrangedSubview(characterImageView)
    }
    
    private func initializeLabels(){
        
        let labelsStackView = UIStackView()
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .fillEqually
        
        mainStackView.addArrangedSubview(labelsStackView)
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: labelsStackView, attribute: .height, relatedBy: .equal, toItem: characterImageView, attribute: .height, multiplier: 1.0, constant: 0.0).isActive = true
        
        let nameLabelStackView = UIStackView()
        nameLabelStackView.axis = .vertical
        nameLabelStackView.distribution = .fill
        
        labelsStackView.addArrangedSubview(nameLabelStackView)
        
        let nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.textColor = .red
        nameLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
        nameLabel.textAlignment = .left
        
        characterNameLabel = UILabel()
        characterNameLabel.textColor = .gray
        characterNameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15.0)
        characterNameLabel.numberOfLines = 1
        characterNameLabel.textAlignment = .left
        
        nameLabelStackView.addArrangedSubview(nameLabel)
        nameLabelStackView.addArrangedSubview(characterNameLabel)
        
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor, multiplier: 3.0).isActive = true
        
        let descriptionLabelStackView = UIStackView()
        descriptionLabelStackView.axis = .vertical
        descriptionLabelStackView.distribution = .fill
        
        labelsStackView.addArrangedSubview(descriptionLabelStackView)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        descriptionLabel.textColor = .red
        descriptionLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
        
        characterDescriptionLabel = UILabel()
        characterDescriptionLabel.textColor = .gray
        characterDescriptionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15.0)
        characterDescriptionLabel.numberOfLines = 6
        characterDescriptionLabel.textAlignment = .natural
        
        descriptionLabelStackView.addArrangedSubview(descriptionLabel)
        descriptionLabelStackView.addArrangedSubview(characterDescriptionLabel)
        
        characterDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        characterDescriptionLabel.heightAnchor.constraint(equalTo: descriptionLabel.heightAnchor, multiplier: 3.0).isActive = true
    }
}

extension DetailsViewController: DetailsPresenterOutput{
    
    func fetchedDetailsDisplay(display: DetailsDisplay) {
        
        characterImageView.sd_setImage(with: URL(string: display.thumb), completed: nil)
        characterNameLabel.text = display.name
        
        guard display.description.count > 0 else{
            characterDescriptionLabel.text = " - "
            characterDescriptionLabel.textAlignment = .center
            return
        }
        characterDescriptionLabel.text = display.description
    }
}
