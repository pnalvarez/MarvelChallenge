//
//  CharacterListInteractorBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct CharacterListInteractorBuilder{
    
    static func make(manager: CharacterListManagerInput) -> CharacterListInteractor{
        
        return CharacterListInteractor(manager: manager)
    }
}
