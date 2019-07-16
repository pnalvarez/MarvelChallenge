//
//  SplashPresenter.swift
//  MarvelChallenge
//
//  Created by Pedro.Alvarez on 16/07/19.
//  Copyright © 2019 Pedro.Alvarez. All rights reserved.
//

import Foundation

protocol SplashPresenterInput {
    
    func viewDidLoad()
}

final class SplashPresenter: SplashPresenterInput{
    
    var wireframe: SplashWireframe
    
    init(wireframe: SplashWireframe) {
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3){
            print("Saiu da ")
        }
    }
}
