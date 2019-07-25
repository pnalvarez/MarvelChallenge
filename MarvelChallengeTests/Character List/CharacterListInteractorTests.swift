//
//  CharacterListInteractorTests.swift
//  MarvelChallengeTests
//
//  Created by Pedro Alvarez on 24/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import XCTest
@testable import MarvelChallenge

class CharacterListInteractorTests: XCTestCase {
    
    var characterDisplay: [CharacterListDisplay] = []
    var charactersDisplayMock: [CharacterListDisplay] = [CharacterListDisplay(id: 0, name: "Test0", thumb: "Thumb0", description: "Description0", comics: []), CharacterListDisplay(id: 1, name: "Test1", thumb: "Thumb1", description: "Description1", comics: []), CharacterListDisplay(id: 2, name: "Test2", thumb: "Thumb2", description: "Description2", comics: []), CharacterListDisplay(id: 3, name: "Test3", thumb: "Thumb3", description: "Description3", comics: [])]
    
    var interactor: CharacterListInteractorInput?

    override func setUp() {
        
        interactor = CharacterListInteractorBuilder.make(manager: CharacterListManagerMock())
        interactor?.output = self
    }

    override func tearDown() {

        interactor = nil
        characterDisplay = []
    }

    func testFirstLoad() {
        
        interactor?.firstLoad()
        
        XCTAssert(characterDisplay.count == 4)
        
        for i in 0...characterDisplay.count - 1{
            XCTAssert(characterDisplay[i].id == charactersDisplayMock[i].id)
            XCTAssert(characterDisplay[i].name == charactersDisplayMock[i].name)
            XCTAssert(characterDisplay[i].description == charactersDisplayMock[i].description)
            XCTAssert(characterDisplay[i].thumb == charactersDisplayMock[i].thumb)
        }
    }
    
    func testLoadNextCharacter(){
        
        interactor?.loadNextCharacter(offset: 2)
        
        XCTAssert(characterDisplay[0].id == charactersDisplayMock[1].id)
        XCTAssert(characterDisplay[0].name == charactersDisplayMock[1].name)
        XCTAssert(characterDisplay[0].description == charactersDisplayMock[1].description)
        XCTAssert(characterDisplay[0].thumb == charactersDisplayMock[1].thumb)
    }
}

extension CharacterListInteractorTests: CharacterListInteractorOutput{
    
    func loadedCharacters(characters: [CharacterEntity]) {
        
        self.characterDisplay.append(contentsOf: CharacterMapper.make(from: characters))
    }
}
