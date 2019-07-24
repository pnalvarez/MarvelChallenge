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
    var comicsScrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    var presenter: DetailsPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeStackViews()
        initializeImageView()
        initializeLabels()
//        initializeComicsView()
        
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
        characterImageView.bounds.size.width = view.bounds.size.width
        characterImageView.contentMode = .scaleToFill
        
        mainStackView.addArrangedSubview(characterImageView)
    }
    
    private func initializeLabels(){
        
        let labelsStackView = UIStackView()
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .fillEqually
        
        mainStackView.addArrangedSubview(labelsStackView)
        mainStackView.addArrangedSubview(UIView())
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: labelsStackView, attribute: .height, relatedBy: .equal, toItem: characterImageView, attribute: .height, multiplier: 1.0, constant: 0.0).isActive = true
        
        let nameLabelStackView = UIStackView()
        nameLabelStackView.axis = .vertical
        nameLabelStackView.distribution = .fill
        
        labelsStackView.addArrangedSubview(UIView())
        labelsStackView.addArrangedSubview(nameLabelStackView)
        
        let nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.textColor = .red
        nameLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
        nameLabel.textAlignment = .left
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        
        characterNameLabel = UILabel()
        characterNameLabel.textColor = .gray
        characterNameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15.0)
        characterNameLabel.numberOfLines = 1
        characterNameLabel.textAlignment = .left
        characterNameLabel.minimumScaleFactor = 0.5
        characterNameLabel.adjustsFontSizeToFitWidth = true
        
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
        descriptionLabel.minimumScaleFactor = 0.5
        descriptionLabel.adjustsFontSizeToFitWidth = true
        
        characterDescriptionLabel = UILabel()
        characterDescriptionLabel.textColor = .gray
        characterDescriptionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15.0)
        characterDescriptionLabel.numberOfLines = 6
        characterDescriptionLabel.textAlignment = .natural
        characterDescriptionLabel.minimumScaleFactor = 0.5
        characterDescriptionLabel.adjustsFontSizeToFitWidth = true
        
        descriptionLabelStackView.addArrangedSubview(descriptionLabel)
        descriptionLabelStackView.addArrangedSubview(characterDescriptionLabel)
        
        characterDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        characterDescriptionLabel.heightAnchor.constraint(equalTo: descriptionLabel.heightAnchor, multiplier: 3.0).isActive = true
    }
    
    private func initializeComicsView(){
        
        let contentView = UIView()
        comicsScrollView = UIScrollView()
        
        pageControl = UIPageControl()
        
        guard let pageNumber = presenter?.getComicPages().count else{ return }
        
        comicsScrollView.contentSize = CGSize(width: contentView.frame.width * CGFloat(pageNumber), height: contentView.frame.height)
        comicsScrollView.isPagingEnabled = true
        
        guard let comicPages = presenter?.getComicPages() else{ return }
        
        for i in 0..<pageNumber{
            
            let comicImageView = UIImageView(frame: CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height))
            comicImageView.sd_setImage(with: URL(string: comicPages[i].thumb), completed: nil)
            comicsScrollView.addSubview(comicImageView)
        }
        
        pageControl.numberOfPages = pageNumber
        pageControl.currentPage = 0
        contentView.bringSubviewToFront(pageControl)

        contentView.addSubview(comicsScrollView)

        comicsScrollView.translatesAutoresizingMaskIntoConstraints = false
        comicsScrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        comicsScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        comicsScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        comicsScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        mainStackView.addArrangedSubview(contentView)
        
        pageControl = UIPageControl(frame: CGRect(x: contentView.bounds.size.width / 2, y: contentView.bounds.size.height * 0.9, width: contentView.bounds.size.width, height: contentView.bounds.size.height * 0.9))
        contentView.addSubview(pageControl)
    }
    
    
//    private func initializeScrollView(){
//
//        scrollView = UIScrollView()
//        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
//
//        view.addSubview(scrollView)
//
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//    }
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

extension DetailsViewController: UIScrollViewDelegate{
    
}
