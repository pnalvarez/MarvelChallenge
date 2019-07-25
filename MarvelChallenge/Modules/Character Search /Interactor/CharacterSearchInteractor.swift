//
//  CharacterSearchInteractor.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 24/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

protocol CharacterSearchInteractorInput{
    
    func fetchAll()
    
    var output: CharacterSearchInteractorOutput?{get set}
}

protocol CharacterSearchInteractorOutput: class{
    
    func fetchedCharacters(output: [CharacterEntity])
}

final class CharacterSearchInteractor: CharacterSearchInteractorInput{
    
    var manager: CharacterSearchManagerInput
    weak var output: CharacterSearchInteractorOutput?
    
    var characters: [CharacterEntity] = []
    
    init(manager: CharacterSearchManagerInput) {
        self.manager = manager
    }
    
    func fetchAll() {
        
        for i in 0..<14{
            manager.fetchPortion(offset: i + 100){ characters in
                self.characters.append(contentsOf: characters)
            }
        }
        output?.fetchedCharacters(output: self.characters)
    }
}
