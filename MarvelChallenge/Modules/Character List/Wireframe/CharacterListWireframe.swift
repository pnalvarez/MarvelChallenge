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
    
    func present(window: UIWindow){
        
        window.rootViewController = CharacterListViewControllerBuilder.make(wireframe: self)
    }
}
