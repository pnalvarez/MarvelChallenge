//
//  CharacterEntity.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation
import ObjectMapper

final class CharacterEntity: NSObject, Mappable{
    
    static var total: Int = 0
    var id: Int = 0
    var name: String = ""
    
    private var thumbnail: [String : Any] = [:]
    
    private var path: String{
        return thumbnail["path"] as! String
    }
    
    private var fileExtension: String{
        return thumbnail["extension"] as! String
    }
    
    var thumb: String{
        return path + "." + fileExtension
    }
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        thumbnail <- map["thumbnail"]
    }
}
