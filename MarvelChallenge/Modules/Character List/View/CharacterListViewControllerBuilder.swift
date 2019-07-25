//
//  CharacterListViewControllerBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation
import UIKit

struct CharacterListViewControllerBuilder{
    
    var stackView: UIStackView!
    
    static func make(wireframe: CharacterListWireframe) -> CharacterListViewController{
        
        let manager = CharacterListManager()
        let interactor = CharacterListInteractorBuilder.make(manager: manager)
        let viewController = CharacterListViewController()
        let presenter = CharacterListPresenterBuilder.make(wireframe: wireframe, interactor: interactor)
        
        interactor.output = presenter
        
        presenter.output = viewController
        viewController.presenter = presenter

        return viewController
    }
}
