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
    var headerVerticalStackView: UIStackView!
    var headerHorizontalStackView: UIStackView!
    var headerImageView: UIImageView!
    var defaultActivityIndicator: UIActivityIndicatorView!
    
    var presenter: CharacterListPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()

       setNeedsStatusBarAppearanceUpdate()
       initializeStackViews()
       initializeTableView()
       handleEmptyTableView()
        
       presenter?.viewDidLoad()
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
    
    private func initializeStackViews(){
    
        headerImageView = UIImageView()
        headerImageView.image =  UIImage(named: "marvel-logo")

        headerVerticalStackView = UIStackView()
        headerVerticalStackView.axis = .vertical
        headerVerticalStackView.distribution = .fillEqually

        headerHorizontalStackView = UIStackView()
        headerHorizontalStackView.axis = .horizontal
        headerHorizontalStackView.distribution = .fillEqually

        headerHorizontalStackView.addArrangedSubview(UIView())
        headerHorizontalStackView.addArrangedSubview(headerImageView)
        headerHorizontalStackView.addArrangedSubview(UIView())

        headerVerticalStackView.addArrangedSubview(UIView())
        headerVerticalStackView.addArrangedSubview(headerHorizontalStackView)
        headerVerticalStackView.addArrangedSubview(UIView())
        
        navigationItem.titleView = headerImageView
    }
    
    private func handleEmptyTableView(){
        
        charactersTableView.separatorStyle = .none
        
        defaultActivityIndicator = UIActivityIndicatorView(style: .gray)
        defaultActivityIndicator.startAnimating()
        defaultActivityIndicator.backgroundColor = .gray
        defaultActivityIndicator.color = .white
        
        charactersTableView.backgroundView = defaultActivityIndicator
    }
}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let rowCount = presenter?.numberOfRowsInSection() else{
            return 0
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let displayContent = presenter?.displayForRowInSection(index: indexPath.row) else{
            let loadingCell = LoadingTableViewCell()
            loadingCell.configure()
            return loadingCell
        }
        
        let cell = CharacterListTableViewCell()
        cell.initializeCell()

        cell.configure(display: displayContent)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return charactersTableView.frame.height / 6
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if tableView.visibleCells.contains(cell) {
                self.presenter?.cellWillDisplay(index: indexPath.row)
            }
        }
    }
}

extension CharacterListViewController: CharacterListPresenterOutput{
    
    func updateUI() {
        
        DispatchQueue.main.async {
            self.charactersTableView.reloadData()
        }
    }
}
