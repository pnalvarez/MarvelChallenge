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
    
    var output: CharacterListPresenterOutput?{get}
}

protocol CharacterListPresenterOutput: class{
    
}


final class CharacterListPresenter: CharacterListPresenterInput{
    
    weak var output: CharacterListPresenterOutput?
    
    func viewDidLoad() {
        
    }
}
