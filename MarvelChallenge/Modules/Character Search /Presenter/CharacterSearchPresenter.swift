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
    func viewDidLoad()
    
    var output: CharacterSearchPresenterOutput?{get set}
}

protocol CharacterSearchPresenterOutput: class{
    
    func updateUI()
}

final class CharacterSearchPresenter: CharacterSearchPresenterInput{
    
    var wireframe: CharacterSearchWireframe
    var interactor: CharacterSearchInteractorInput
    weak var output: CharacterSearchPresenterOutput?
    
    var charactersDisplay: [CharacterListDisplay] = []
    
    init(wireframe: CharacterSearchWireframe, interactor: CharacterSearchInteractorInput) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor.fetchAll()
    }
    
    func numberOfRows() -> Int {
        
        return charactersDisplay.count
    }
    
    func contentForRow(at index: Int) -> CharacterListDisplay {
        
        return charactersDisplay[index]
    }
}

extension CharacterSearchPresenter: CharacterSearchInteractorOutput{
    
    func fetchedCharacters(output: [CharacterEntity]) {
        self.charactersDisplay = CharacterMapper.make(from: output)
        self.output?.updateUI()
    }
}
