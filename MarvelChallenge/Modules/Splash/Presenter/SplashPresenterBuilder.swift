//
//  SplashPresenterBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct SplashPresenterBuilder{
    
    static func make(wireframe: SplashWireframe) -> SplashPresenter{
        
        return SplashPresenter(wireframe: wireframe)
    }
}
