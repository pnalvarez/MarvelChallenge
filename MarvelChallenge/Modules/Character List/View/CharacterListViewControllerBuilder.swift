//
//  CharacterListViewControllerBuilder.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation
import UIKit

struct CharacterListViewControllerBuilder{
    
    var stackView: UIStackView!
    
    static func make(wireframe: CharacterListWireframe) -> CharacterListViewController{
        
        let viewController = CharacterListViewController()
        
        return viewController
    }
}
