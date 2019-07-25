//
//  CharacterSearchViewControllerBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 23/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct CharacterSearchViewControllerBuilder{
    
    static func make(wireframe: CharacterSearchWireframe) -> CharacterSearchViewController{
        
        let presenter = CharacterSearchPresenterBuilder.make(wireframe: wireframe)
        let viewController = CharacterSearchViewController()
        
        viewController.presenter = presenter
        presenter.output = viewController
        
        return viewController
    }
}
