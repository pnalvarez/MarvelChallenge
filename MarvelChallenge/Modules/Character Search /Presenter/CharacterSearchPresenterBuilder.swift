//
//  CharacterSearchPresenterBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 24/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct CharacterSearchPresenterBuilder{
    
    static func make(wireframe: CharacterListWireframe) -> CharacterSearchPresenter{
        
        let interactor = CharacterSearchInteractorBuilder.make()
        let presenter = CharacterSearchPresenter(wireframe: wireframe, interactor: interactor)
        
        interactor.output = presenter
        
        return presenter
    }
}
