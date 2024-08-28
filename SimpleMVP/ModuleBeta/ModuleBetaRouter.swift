//
//  ModuleBetaRouter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

protocol ModuleBetaRouterProtocol {
    func showSuccess()
    func showError()
    func showConfirmation()
    
    // Модуль Beta показывает модуль Gamma и передает в него параметры.
    func openModuleGamma(with param: String)
}

final class ModuleBetaRouter: ModuleBetaRouterProtocol {
    
    private let alertFactory: AlertModuleFactory
    private let factory: ModuleGammaFactory
        
    weak var root: UIViewController?
    
    init(alertFactory: AlertModuleFactory, factory: ModuleGammaFactory) {
        self.alertFactory = alertFactory
        self.factory = factory
    }
    
    
    func setRootViewController(root: UIViewController) {
        self.root = root
    }
    
    func showSuccess() {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save success"
        )
        
        root?.present(viewController, animated: true)
    }
    
    func showError() {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save error"
        )
        
        root?.present(viewController, animated: true)
    }
    
    
    // ???
    func showConfirmation() {
        let viewController = alertFactory.newMethod(
            title: "SimpleMVP",
            message: "Save changes?",
            nameButtonOK: "Ok",
            nameButtonCancel: "Cancel",
            handlerOK: { [weak self] _ in
                self?.showSuccess()
            },
            handlerCancel: { [weak self] _ in
                self?.showError()
            }
        )
    }
    
    // Модуль Alpha показывает модуль Beta и передает в него параметры.
    func openModuleGamma(with param: String) {
        
        let context = ModuleGammaFactory.Context(
            someParam: param,
            someValue: 100
        )
        
        let viewController = factory.make(context: context)
        
        root?.navigationController?.pushViewController(viewController, animated: true)
    }
}
