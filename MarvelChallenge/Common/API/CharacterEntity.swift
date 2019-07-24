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
    var charDescription: String = ""
    var comics: [String : Any] = [:]
    var series: [String : Any] = [:]
    var events: [String : Any] = [:]
    var stories: [String : Any] = [:]
    
    var comicList: [ComicEntity]{
        
        return getEventsList() + getComicItems() + getSeriesItems() + getStoriesList()
    }
    
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
        charDescription <- map["description"]
        comics <- map["comics"]
        series <- map["series"]
        stories <- map["stories"]
        events <- map["events"]
    }
    
    private func getComicItems() -> [ComicEntity]{
        
        var comicsList: [ComicEntity] = []
        
        if let items = comics["items"] as? [[String : Any]]{
            
            for item in items{
                comicsList.append(ComicEntity(title: item["name"] as! String, thumb: item["resourceURI"] as! String))
            }
        }
        return comicsList
    }
    
    private func getSeriesItems() -> [ComicEntity]{
        
        var seriesList: [ComicEntity] = []
        
        if let items = comics["series"] as? [[String : Any]]{
            
            for item in items{
                seriesList.append(ComicEntity(title: item["name"] as! String, thumb: item["resourceURI"] as! String))
            }
        }
        return seriesList
    }
    
    private func getStoriesList() -> [ComicEntity]{
        
        var storiesList: [ComicEntity] = []
        
        if let items = comics["stories"] as? [[String : Any]]{
            
            for item in items{
                storiesList.append(ComicEntity(title: item["name"] as! String, thumb: item["resourceURI"] as! String))
            }
        }
        return storiesList
    }
    
    private func getEventsList() -> [ComicEntity]{
        
        var eventsList: [ComicEntity] = []
        
        if let items = comics["events"] as? [[String : Any]]{
            
            for item in items{
                eventsList.append(ComicEntity(title: item["name"] as! String, thumb: item["resourceURI"] as! String))
            }
        }
        return eventsList
    }
}
