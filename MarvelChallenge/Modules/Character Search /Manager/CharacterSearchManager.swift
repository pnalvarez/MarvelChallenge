//
//  CharacterSearchManager.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 24/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

protocol CharacterSearchManagerInput{
    
    func fetchPortion(offset: Int, completion: @escaping ([CharacterEntity]) -> ())
}

final class CharacterSearchManager: CharacterSearchManagerInput{
    
    func fetchPortion(offset: Int, completion: @escaping ([CharacterEntity]) -> ()) {
       
        APIProvider().getCharacters(offset: offset, limit: 100){ characters in
            completion(CharacterMapper.make(from: characters))
        }
    }
}
