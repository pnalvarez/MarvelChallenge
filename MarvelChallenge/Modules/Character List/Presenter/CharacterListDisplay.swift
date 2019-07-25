//
//  CharacterListDisplay.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 17/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct CharacterListDisplay{
    
    var id: Int
    var thumb: String
    var name: String
    var description: String
    var comics: [ComicEntity] = []
    
    static var total: Int{
        return CharacterEntity.total
    }
    
    
    init(id: Int, name: String, thumb: String, description: String, comics: [ComicEntity]) {
        self.id = id
        self.thumb = thumb
        self.name = name
        self.description = description
        self.comics = comics
    }
}
