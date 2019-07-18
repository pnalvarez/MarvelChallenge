//
//  CharacterListPresenterBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct CharacterListPresenterBuilder{
    
    static func make(wireframe: CharacterListWireframe) -> CharacterListPresenter{
        
        let interactor = CharacterListInteractorBuilder.make()
        let presenter = CharacterListPresenter(interactor: interactor, wireframe: wireframe)
        
        interactor.output = presenter
        
        return presenter
    }
}
