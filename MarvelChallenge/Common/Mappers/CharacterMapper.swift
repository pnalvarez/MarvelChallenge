//
//  CharacterListMapper.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 17/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

final class CharacterMapper{
    
    static func make(from characterList: [CharacterEntity]) -> [CharacterListDisplay]{
        
        var displayList: [CharacterListDisplay] = []
        
        for item in characterList{
            displayList.append(CharacterMapper.make(from: item))
        }
        return displayList
    }
    
    static func make(from characterList: [CharacterAPIModel]) -> [CharacterEntity]{
        
        var characters: [CharacterEntity] = []
        
        for item in characterList{
            characters.append(CharacterMapper.make(from: item))
        }
        
        return characters
    }
    
    static func make(from character: CharacterEntity) -> CharacterListDisplay{
        
        return CharacterListDisplay(id: character.id, name: character.name, thumb: character.thumb, description: character.charDescription, comics: character.comicList)
    }
    
    static func make(from character: CharacterListDisplay) -> DetailsDisplay{
        
        return DetailsDisplay(name: character.name, thumb: character.thumb, description: character.description, comics: character.comics)
    }
    
    static func make(from character: CharacterAPIModel) -> CharacterEntity{
        
        return CharacterEntity(id: character.id, name: character.name, thumb: character.thumb, charDescription: character.charDescription, comicList: character.comicList)
    }
}
