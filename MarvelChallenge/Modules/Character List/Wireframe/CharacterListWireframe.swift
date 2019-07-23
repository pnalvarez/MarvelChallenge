//
//  CharacterListWireframe.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation
import UIKit

final class CharacterListWireframe{
    
    var navigationController: UINavigationController?
    
    func present(window: UIWindow){
        
        self.navigationController = UINavigationController(rootViewController: CharacterListViewControllerBuilder.make(wireframe: self))
        window.rootViewController = self.navigationController
    }
    
    func presentDetails(display: CharacterListDisplay){
        
        let detailsDisplay = CharacterMapper.make(from: display)
        
        guard let navigationController = self.navigationController else{ return }
        
        DetailsWireframe().present(display: detailsDisplay, navigationController: navigationController)
    }
}
