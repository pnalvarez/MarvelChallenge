//
//  CharacterEntity.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation
import ObjectMapper

final class CharacterEntity: NSObject{
    
    static var total: Int = 0
    
    var id: Int = 0
    var name: String = ""
    var thumb: String = ""
    var charDescription: String = ""
    var comicList: [ComicEntity] = []
    
    init(id: Int, name: String, thumb: String, charDescription: String, comicList: [ComicEntity]) {
        self.id = id
        self.name = name
        self.thumb = thumb
        self.charDescription = charDescription
        self.comicList = comicList
    }
}
