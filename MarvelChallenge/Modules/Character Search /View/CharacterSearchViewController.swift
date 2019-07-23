//
//  CharacterSearchViewController.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 18/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import UIKit

class CharacterSearchViewController: UIViewController {
    
    var charactersTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeView()
    }

}

extension CharacterSearchViewController{
    
    private func initializeView(){
        
        charactersTableView = UITableView()
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
        
        view.addSubview(charactersTableView)
        
        charactersTableView.translatesAutoresizingMaskIntoConstraints = false
        charactersTableView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1.0).isActive = true
        charactersTableView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1.0).isActive = true
        charactersTableView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 1.0).isActive = true
        charactersTableView.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 1.0).isActive = true
    }
}

extension CharacterSearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
