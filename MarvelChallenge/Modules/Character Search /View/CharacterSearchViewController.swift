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
    
    var presenter: CharacterSearchPresenterInput?
    
    let searchController = UISearchController(searchResultsController: nil)

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
        charactersTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        charactersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        charactersTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        charactersTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension CharacterSearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = presenter?.numberOfRows() else{ return 0}
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = CharacterSearchTableViewCell()
        
        guard let display = presenter?.contentForRow(at: indexPath.row) else{ return UITableViewCell() }
        
        cell.configure(display: display)
        
        return cell
    }
}

extension CharacterSearchViewController: CharacterSearchPresenterOutput{
    
    func updateUI() {
        DispatchQueue.main.async {
            self.charactersTableView.reloadData()
        }
    }
}
