//
//  CharacterListViewController.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    var charactersTableView: UITableView!
    
    var presenter: CharacterListPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()

       initializeTableView()
    }

}

extension CharacterListViewController{
    
    private func initializeTableView(){
        
        charactersTableView = UITableView()
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
        
        view.addSubview(charactersTableView)
        
        charactersTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: charactersTableView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: charactersTableView, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: charactersTableView, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: charactersTableView, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
    }
}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
