//
//  UIViewController+Extension.swift
//  Custom-TabBar
//
//  Created by ADMIN on 04/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var instantiate: UIViewController {
        let viewController = UIStoryboard(name: "Main", bundle: .none)
            .instantiateViewController(identifier: identifier)
        return viewController
    }
    
    private func present(_ dismissableAlert: UIAlertController) {
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
        dismissableAlert.addAction(dismissAction)
        present(dismissableAlert, animated: true)
    }
    
    func presentAlert(with message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(alert)
    }
    
    func present(_ error: Error) {
        presentAlert(with: error.localizedDescription)
    }
}
