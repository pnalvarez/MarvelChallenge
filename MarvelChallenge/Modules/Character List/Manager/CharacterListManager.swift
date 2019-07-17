//
//  ChracterListManager.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

protocol CharacterListManagerInput{
    
    func getInitialCharacterList(completion: @escaping ([CharacterEntity]) -> ())
    func getNewCharacter(offset: Int, completion: @escaping (CharacterEntity) -> ())
}

final class CharacterListManager: CharacterListManagerInput{
    
    func getInitialCharacterList(completion: @escaping ([CharacterEntity]) -> ()) {
        
        APIProvider().getCharacters(offset: 0, limit: 6){ characters in
            completion(characters)
        }
    }
    
    func getNewCharacter(offset: Int, completion: @escaping (CharacterEntity) -> ()) {
        
        APIProvider().getCharacters(offset: offset, limit: 1){  characters in
            
            if characters.count > 0{
                completion(characters[0])
            }
        }
    }
}
