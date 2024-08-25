//
//  ModuleGammaRouter.swift
//  SimpleMVP
//
//  Created by Александр Новиков on 25.08.2024.

import UIKit

protocol ModuleGammaRouterProtocol {
    func showSuccess()
    func showError()
}

final class ModuleGammaRouter: ModuleGammaRouterProtocol {
    
    weak var root: UIViewController?
    
    private let alertFactory: AlertModuleFactory
    
    init(alertFactory: AlertModuleFactory){
        self.alertFactory = alertFactory
    }
    
    func setRootViewController(root: UIViewController){
        self.root = root
    }
    
    func showSuccess() {
        let viewController = alertFactory.make(
            title: "Module Gamma",
            message: "Save success"
        )
        
        root?.present(viewController, animated: true)
    }
    
    func showError() {
        let viewController = alertFactory.make(
            title: "Module Gamma",
            message: "Save error"
        )
        
        root?.present(viewController, animated: true)
    }
}
