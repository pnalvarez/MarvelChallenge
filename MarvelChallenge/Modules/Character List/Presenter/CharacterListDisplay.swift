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
    
    static var total: Int{
        return CharacterEntity.total
    }
    
    
    init(id: Int, thumb: String, name: String, description: String) {
        self.id = id
        self.thumb = thumb
        self.name = name
        self.description = description
    }
}
