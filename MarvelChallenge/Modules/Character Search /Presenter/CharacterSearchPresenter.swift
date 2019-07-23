//
//  CharacterSearchPresenter.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 23/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

protocol CharacterSearchPresenterInput{
    
    func numberOfRows() -> Int
    func contentForRow(at index: Int) -> CharacterListDisplay
}

final class CharacterSearchPresenter: CharacterSearchPresenterInput{
    
    var wireframe: CharacterSearchWireframe
    
    var charactersDisplay: [CharacterListDisplay] = []
    
    init(wireframe: CharacterSearchWireframe, charactersDisplay: [CharacterListDisplay]) {
        self.wireframe = wireframe
        self.charactersDisplay = charactersDisplay
    }
    
    func numberOfRows() -> Int {
        
        return charactersDisplay.count
    }
    
    func contentForRow(at index: Int) -> CharacterListDisplay {
        
        return charactersDisplay[index]
    }
}
