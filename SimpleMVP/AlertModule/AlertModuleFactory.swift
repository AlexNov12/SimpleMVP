//
//  AlertModuleFactory.swift
//  SimpleMVVM
//
//  Created by Dmitriy Mirovodin on 16.02.2024.
//

import UIKit

final class AlertModuleFactory {
    
    func make(title: String, message: String) -> UIViewController {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        
        
        alertViewController.addAction(action)
        
        return alertViewController
    }
    
    func newMethod(
        title: String,
        message: String,
        nameButtonOK: String,
        nameButtonCancel: String,
        handlerOK: @escaping (UIAlertAction)->(),
        handlerCancel: @escaping (UIAlertAction)->()
    ) -> UIViewController {
        
        let saveChangesAlertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: nameButtonOK,
            style: .default,
            handler: handlerOK
        )
        
        let cancel = UIAlertAction(
            title: nameButtonCancel,
            style: .cancel,
            handler: nil
        )
        
        saveChangesAlertViewController.addAction(action)
        saveChangesAlertViewController.addAction(cancel)
        
        return saveChangesAlertViewController
    }
}
