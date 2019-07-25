//
//  CharacterListPresenterTests.swift
//  MarvelChallengeTests
//
//  Created by Pedro Alvarez on 24/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import XCTest
@testable import MarvelChallenge

class CharacterListPresenterTests: XCTestCase {

    var charactersDisplay: [CharacterListDisplay] = []
    
    var charactersDisplayMock: [CharacterListDisplay] = [CharacterListDisplay(id: 0, name: "Test0", thumb: "Thumb0", description: "Description0", comics: []), CharacterListDisplay(id: 1, name: "Test1", thumb: "Thumb1", description: "Description1", comics: []), CharacterListDisplay(id: 2, name: "Test2", thumb: "Thumb2", description: "Description2", comics: []), CharacterListDisplay(id: 3, name: "Test3", thumb: "Thumb3", description: "Description3", comics: [])]
    
    var presenter: CharacterListPresenter?
    
    override func setUp() {
        
        let interactor = CharacterListInteractorMock()
        
        presenter = CharacterListPresenterBuilder.make(wireframe: CharacterListWireframe(), interactor: interactor)
        interactor.output = presenter
        presenter?.output = self
    }

    override func tearDown() {
        presenter = nil
        charactersDisplay = []
    }

    func testViewDidLoad() {
        presenter?.viewDidLoad()
        
        XCTAssert(charactersDisplay.count == charactersDisplayMock.count)
       
        for i in 0..<charactersDisplay.count{
            XCTAssert(charactersDisplay[i].id == charactersDisplayMock[i].id)
        }
    }
    
    func testCellWillDisplay(){
        presenter?.cellWillDisplay(index: 0)
        
        XCTAssert(charactersDisplay.count == 1)
        XCTAssert(charactersDisplay[0].id == charactersDisplayMock[0].id)
    }
}

extension CharacterListPresenterTests: CharacterListPresenterOutput{
    
    func updateUI() {
        
        guard let count: Int = presenter?.numberOfRowsInSection() else{ return }
        
        for i in 0..<count{
           
            guard let display = presenter?.displayForRowInSection(index: i) else{ return }
            self.charactersDisplay.append(display)
        }
    }
}
