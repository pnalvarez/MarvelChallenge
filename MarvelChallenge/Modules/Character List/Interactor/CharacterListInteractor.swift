//
//  CharacterListInteractor.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

protocol CharacterListInteractorInput{
    
    func firstLoad()
    func loadNextCharacter(offset: Int)
    
    var output: CharacterListInteractorOutput?{get set}
}

protocol CharacterListInteractorOutput: class{
    
    func loadedCharacters(characters: [CharacterEntity])
}

final class CharacterListInteractor: CharacterListInteractorInput{
    
    var currentOffset: Int = 0
    
    weak var output: CharacterListInteractorOutput?
    var manager: CharacterListManagerInput
    
    init(manager: CharacterListManagerInput){
        self.manager = manager
    }
    
    func firstLoad() {
        
        manager.getInitialCharacterList{ characters in
            
            self.currentOffset = 6
            self.output?.loadedCharacters(characters: characters)
        }
    }
    
    func loadNextCharacter(offset: Int) {
        
        guard currentOffset < offset else{
            return
        }
        
        currentOffset += 1
        
        manager.getNewCharacter(offset: currentOffset){ character in
            
            self.output?.loadedCharacters(characters: [character])
        }
    }
    
}
