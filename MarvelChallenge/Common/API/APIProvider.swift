//
//  APIProvider.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

final class APIProvider{
    
    let baseURL = "http://gateway.marvel.com/v1/public/characters"
    
    func getCharacter(id: String, completion: @escaping (CharacterEntity) -> ()){
        
        let characterURL = baseURL+"/\(id)?"+"ts=1&apikey=5d270d6ba90b8e7de71d2a65b6cce967&hash=1eb2d8a190e62c0ecf934462a91eb071"
        
        request(url: characterURL){ character in
            
            guard let result = character, let data = result["data"] as? [String : Any], let char = Mapper<CharacterEntity>().mapArray(JSONObject: data["results"]) else{
                return
            }
            
            if char.count > 0{
                completion(char[0])
            }
        }
    }
    
    func getCharacters(offset: Int, limit: Int, completion: @escaping ([CharacterEntity]) -> ()){
        
        let url = baseURL+"?ts=1&apikey=5d270d6ba90b8e7de71d2a65b6cce967&hash=1eb2d8a190e62c0ecf934462a91eb071&offset=\(offset)&limit=\(limit)"
        
        request(url: url){ character in
            
            guard let result = character, let data = result["data"] as? [String : Any], let chars = Mapper<CharacterEntity>().mapArray(JSONObject: data["results"]) else{
                completion([])
                return
            }
            
            completion(chars)
        }
    }
    
    private func request(url: String, completion: @escaping ([String: Any]?) -> ()){
        
        guard let url = URL(string: url) else{
            return
        }
        
        let _ = Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON(completionHandler: { (response) in
            
            completion(response.result.value as? [String : Any])
        })
    }
    
}
