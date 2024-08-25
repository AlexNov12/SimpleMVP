//
//  ModuleGammaPresenter.swift
//  SimpleMVP
//
//  Created by Александр Новиков on 25.08.2024.

import Foundation

protocol ModuleGammaPresenterProtocol {
    var title: String { get }
    
    func viewDidLoad()
    func requestSave()
}

final class ModuleGammaPresenter: ModuleGammaPresenterProtocol {
    
    weak var view: ModuleGammaViewProtocol?
    
    private let dataBaseService: DataBaseServiceProtocol
    private let router: ModuleGammaRouterProtocol
    private let someParam: String
    
    var title: String { "Module G" }
    
    var analiticScreenName: String { "super_g" }
    
    // someParam - параметр, который получает модуль из другого модуля (в нашем случае модуль Alpha)
    init (
        someParam: String,
        dataBaseService: DataBaseServiceProtocol,
        router: ModuleGammaRouterProtocol
    ) {
        self.dataBaseService = dataBaseService
        self.router = router
        self.someParam = someParam
    }
    
    deinit {
        print(">>> ModuleGammaPresenter is deinit")
    }
    
    func viewDidLoad() {
        let model = ModuleGammaView.Model(
            text: someParam
        )
        view?.update(model: model)
    }
    
    func requestSave() {
            dataBaseService.storeData(value: someParam) { [weak self] (result: Result<Void, Error>) in
                guard let self else { return }
                
                switch result {
                case .success:
                    router.showSuccess()
                case .failure:
                    router.showError()
            }
        }
    }
}

