//
//  CharacterListManagerMock.swift
//  MarvelChallengeTests
//
//  Created by Pedro Alvarez on 24/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation
@testable import MarvelChallenge

final class CharacterListManagerMock: CharacterListManagerInput{
    
    let characterList: [CharacterEntity] = [CharacterEntity(id: 0, name: "Test0", thumb: "Thumb0", charDescription: "Description0", comicList: []), CharacterEntity(id: 1, name: "Test1", thumb: "Thumb1", charDescription: "Description1", comicList: []), CharacterEntity(id: 2, name: "Test2", thumb: "Thumb2", charDescription: "Description2", comicList: []), CharacterEntity(id: 3, name: "Test3", thumb: "Thumb3", charDescription: "Description3", comicList: [])]
    
    func getInitialCharacterList(completion: @escaping ([CharacterEntity]) -> ()) {
        
        completion(characterList)
    }
    
    func getNewCharacter(offset: Int, completion: @escaping (CharacterEntity) -> ()) {
        
        completion(characterList[offset])
    }
}
