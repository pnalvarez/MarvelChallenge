//
//  CharacterListInteractorMock.swift
//  MarvelChallengeTests
//
//  Created by Pedro Alvarez on 24/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation
@testable import MarvelChallenge

final class CharacterListManagerMock: CharacterListManagerInput{
    
    let characterList: [CharacterEntity] = [CharacterEntity(]
    
    func getInitialCharacterList(completion: @escaping ([CharacterEntity]) -> ()) {
        
    }
    
    func getNewCharacter(offset: Int, completion: @escaping (CharacterEntity) -> ()) {
        <#code#>
    }
}
