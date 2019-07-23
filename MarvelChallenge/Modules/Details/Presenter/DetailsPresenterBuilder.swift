//
//  DetailsPresenterBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 23/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct DetailsPresenterBuilder{
    
    static func make(wireframe: DetailsWireframe, display: DetailsDisplay) -> DetailsPresenter{
        
        return DetailsPresenter(wireframe: wireframe, display: display)
    }
}
