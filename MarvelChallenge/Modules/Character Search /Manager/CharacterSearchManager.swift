//
//  CharacterSearchManager.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 24/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

protocol CharacterSearchManagerInput{
    
    func fetchAll(completion: @escaping ([CharacterEntity]) -> ())
}

final class CharacterSearchManager: CharacterSearchManagerInput{
    
    func fetchAll(completion: @escaping ([CharacterEntity]) -> ()) {
        
        var totalCharacters: Int = 0
       
    }
}
