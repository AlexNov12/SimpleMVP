//
//  ModuleGammaFactory.swift
//  SimpleMVP
//
//  Created by Александр Новиков on 25.08.2024.
//

import UIKit

/// Фабрика для создания модуля Gamma
final class ModuleGammaFactory {
    
    // В структуре параметры, которые мы хотим передать в модуль.
    struct Context {
        let someParam: String
        let someValue: Int
    }
    
    func make(context: Context) -> UIViewController {
        /// Только Factory может наполнять Presenter реальными сервисами и другими зависимостями
        let dataBaseService = DataBaseService()
        
        let router = ModuleGammaRouter(
            alertFactory: AlertModuleFactory()
        )
        
        let presenter = ModuleGammaPresenter(
            someParam: context.someParam,
            dataBaseService: dataBaseService,
            router: router
        )
        
        let vc = ModuleGammaViewController(presenter: presenter)
        
        presenter.view = vc
        router.setRootViewController(root: vc)
        
        return vc
        
    }
    
    
    
}

