//
//  DetailsWireframe.swift
//  MarvelChallenge
//
//  Created by Pedro Alvarez on 23/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation
import UIKit

final class DetailsWireframe{
    
    func present(display: DetailsDisplay, navigationController: UINavigationController){
        
        let viewController = DetailsViewControllerBuilder.make(wireframe: self, display: display)
        navigationController.pushViewController(viewController, animated: true)
    }
}
