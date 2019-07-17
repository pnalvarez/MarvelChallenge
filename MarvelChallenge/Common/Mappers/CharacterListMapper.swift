//
//  CharacterListMapper.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 17/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

final class CharacterListMapper{
    
    static func make(from characterList: [CharacterEntity]) -> [CharacterListDisplay]{
        
        var displayList: [CharacterListDisplay] = []
        
        for item in characterList{
            displayList.append(CharacterListMapper.make(from: item))
        }
        return displayList
    }
    
    static func make(from character: CharacterEntity) -> CharacterListDisplay{
        
        return CharacterListDisplay(id: character.id, thumb: character.thumb, name: character.name)
    }
}
