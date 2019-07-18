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
    var label: UILabel!
    
    var presenter: SplashPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeScreen()
        initializeLabel()
        presenter?.viewDidLoad()
    }
}

extension SplashViewController{
    
    private func initializeScreen(){
        
        view.backgroundColor = .black
        logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "marvel-logo")
        
        view.addSubview(logoImageView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: logoImageView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.5, constant: 0.0).isActive = true
        NSLayoutConstraint(item: logoImageView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: logoImageView, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: logoImageView, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
    }
    
    private func initializeLabel(){
        
        label = UILabel()
        label.text = "Marvel Characters Library"
        label.font = UIFont(name: "HelveticaNeue-Light", size: 18.0)
        label.textColor = .white
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: logoImageView, attribute: .bottom, relatedBy: .equal, toItem: label, attribute: .top, multiplier: 1.0, constant: 3.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: label, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: label, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.1, constant: 0.0).isActive = true
    }
}
