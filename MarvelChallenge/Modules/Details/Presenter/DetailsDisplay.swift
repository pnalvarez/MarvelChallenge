//
//  DetailsDisplay.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 23/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct DetailsDisplay{
    
    var name: String
    var thumb: String
    var description: String
    var comics: [ComicEntity] = []
    
    init(name: String, thumb: String, description: String, comics: [ComicEntity]) {
        self.name = name
        self.thumb = thumb
        self.description = description
        self.comics = comics
    }
}
