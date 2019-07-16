//
//  SplashWireframe.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation
import UIKit

final class SplashWireframe{
    
    var window: UIWindow?
    
    func present(window: UIWindow){
        
        window.makeKeyAndVisible()
        window.rootViewController = SplashViewControllerBuilder.make(wireframe: self)
        self.window = window
    }
}
