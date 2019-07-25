//
//  CharacterSearchInteractorBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 24/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct CharacterSearchInteractorBuilder{
    
    static func make() -> CharacterSearchInteractor{
        
        let manager = CharacterSearchManager()
        let interactor = CharacterSearchInteractor(manager: manager)
        
        return interactor
    }
}
