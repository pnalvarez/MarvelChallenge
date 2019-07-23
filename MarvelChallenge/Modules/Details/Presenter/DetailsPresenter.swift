//
//  DetailsPresenter.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 23/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

protocol DetailsPresenterInput{
    
    func viewDidLoad()
    
    var output: DetailsPresenterOutput?{get set}
}

protocol DetailsPresenterOutput: class {
    
    func fetchedDetailsDisplay(display: DetailsDisplay)
}

final class DetailsPresenter: DetailsPresenterInput{
    
    var wireframe: DetailsWireframe?
    weak var output: DetailsPresenterOutput?
    
    private var detailsDisplay: DetailsDisplay?
    
    init(wireframe: DetailsWireframe, display: DetailsDisplay) {
        self.wireframe = wireframe
        self.detailsDisplay = display
    }
    
    func viewDidLoad() {
        
        guard let display = detailsDisplay else{ return }
        
        output?.fetchedDetailsDisplay(display: display)
    }
}
