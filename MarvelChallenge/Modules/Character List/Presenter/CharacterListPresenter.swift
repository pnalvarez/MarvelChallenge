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
    func displayForRowInSection(index: Int) -> CharacterListDisplay?
    func cellWillDisplay(index: Int)
    func didSelectRow(with display: CharacterListDisplay)
    
    var output: CharacterListPresenterOutput?{get set}
}

protocol CharacterListPresenterOutput: class{
    
    func updateUI()
}


final class CharacterListPresenter: CharacterListPresenterInput{
    
    weak var output: CharacterListPresenterOutput?
    var interactor: CharacterListInteractorInput
    var wireframe: CharacterListWireframe
    
    private var charactersDisplay: [CharacterListDisplay] = []
    private var filteredCharacters: [CharacterListDisplay] = []
    
    init(interactor: CharacterListInteractorInput, wireframe: CharacterListWireframe){
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        
        interactor.firstLoad()
    }
    
    func numberOfRowsInSection() -> Int {
        return CharacterListDisplay.total
    }
    
    func displayForRowInSection(index: Int) -> CharacterListDisplay? {
        
        if index < charactersDisplay.count {
            return charactersDisplay[index]
        }
        return nil
    }
    
    func cellWillDisplay(index: Int) {
        
        interactor.loadNextCharacter(offset: index)
    }
    
    func didSelectRow(with display: CharacterListDisplay) {
        wireframe.presentDetails(display: display)
    }
}

extension CharacterListPresenter: CharacterListInteractorOutput{
    
    func loadedCharacters(characters: [CharacterEntity]) {
        
        charactersDisplay.append(contentsOf: CharacterMapper.make(from: characters))
        output?.updateUI()
    }
}
