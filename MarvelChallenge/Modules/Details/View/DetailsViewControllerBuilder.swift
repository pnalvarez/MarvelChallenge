//
//  DetailsViewControllerBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 23/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

struct DetailsViewControllerBuilder{
    
    static func make(wireframe: DetailsWireframe, display: DetailsDisplay) -> DetailsViewController{
        
        let presenter = DetailsPresenterBuilder.make(wireframe: wireframe, display: display)
        let viewController = DetailsViewController()
        
        viewController.presenter = presenter
        presenter.output = viewController
        
        viewController.title = display.name
        
        return viewController
    }
}
