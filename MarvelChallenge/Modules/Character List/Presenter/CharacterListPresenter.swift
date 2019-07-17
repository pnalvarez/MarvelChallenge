//
//  CharacterListPresenter.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

protocol CharacterListPresenterInput{
    
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func displayForRowInSection(index: Int) -> CharacterListDisplay
    
    var output: CharacterListPresenterOutput?{get}
}

protocol CharacterListPresenterOutput: class{
    
}


final class CharacterListPresenter: CharacterListPresenterInput{
    
    weak var output: CharacterListPresenterOutput?
    var interactor: CharacterListInteractorInput
    var wireframe: CharacterListWireframe
    
    private var charactersDisplay: [CharacterListDisplay] = []
    
    init(interactor: CharacterListInteractorInput, wireframe: CharacterListWireframe){
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        
    }
    
    func numberOfRowsInSection() -> Int {
        return charactersDisplay.count
    }
    
    func displayForRowInSection(index: Int) -> CharacterListDisplay {
        return charactersDisplay[index]
    }
    
}

extension CharacterListPresenter: CharacterListInteractorOutput{
    
    func loadedCharacters(characters: [CharacterEntity]) {
        
    }
}
