//
//  SplashViewController.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var logoImageView: UIImageView!
    
    var presenter: SplashPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeScreen()
        presenter?.viewDidLoad()
    }
}

extension SplashViewController{
    
    private func initializeScreen(){
        
        logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "marvel-logo")
        
        view.addSubview(logoImageView)
        
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: logoImageView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: logoImageView, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: logoImageView, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: logoImageView, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
    }
}
