//
//  SplashViewControllerBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct SplashViewControllerBuilder{
    
    static func make(wireframe: SplashWireframe) -> SplashViewController{
        
        let presenter = SplashPresenter(wireframe: wireframe)
        let viewController = SplashViewController()
        
        viewController.presenter = presenter
        
        return viewController
    }
}
