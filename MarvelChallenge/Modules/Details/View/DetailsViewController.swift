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
    var scrollView: UIScrollView!
    
    var presenter: DetailsPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeScrollView()
        initializeImageView()
        presenter?.viewDidLoad()
    }
}

extension DetailsViewController{
    
    private func initializeScrollView(){
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        scrollView.bounces = true
        scrollView.contentSize = view.frame.size
        
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func initializeImageView(){
        
        characterImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        characterImageView.contentMode = .scaleAspectFill
        
        scrollView.addSubview(characterImageView)
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        characterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: scrollView.frame.height / 2).isActive = true
    }
}

extension DetailsViewController: DetailsPresenterOutput{
    
    func fetchedDetailsDisplay(display: DetailsDisplay) {
        
        characterImageView.sd_setImage(with: URL(string: display.thumb), completed: nil)
//        characterNameLabel.text = display.name
//
//        guard display.description.count > 0 else{
//            characterDescriptionLabel.text = " - "
//            characterDescriptionLabel.textAlignment = .center
//            return
//        }
//        characterDescriptionLabel.text = display.description
    }
}
