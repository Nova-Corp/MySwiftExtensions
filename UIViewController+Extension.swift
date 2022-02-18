//
//  UIViewController+Extension.swift
//  Custom-TabBar
//
//  Created by ADMIN on 04/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

var activityView: UIActivityIndicatorView?
var activityBgView: UIView?

extension UIViewController {
    // MARK: ViewController Instantiation
    static var identifier: String {
        return String(describing: self)
    }
    
    static var instantiate: UIViewController {
        var viewController: UIViewController = UIViewController()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: .none)
        
        if #available(iOS 13.0, *) {
            viewController = storyBoard.instantiateViewController(identifier: identifier)
        } else {
            viewController = storyBoard.instantiateViewController(withIdentifier: identifier)
        }
        return viewController
    }
    
    //MARK:- Present Alert
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
    
    //MARK:- Activity Indicator Action
    func showActivityIndicator(backgroundColor: UIColor = .black,
                               activityViewColor: UIColor = .white,
                               duration: Double? = nil,
                               message: String = "",
                               messageColor: UIColor = .white) {
        activityBgView = UIView()
        activityBgView?.backgroundColor = backgroundColor.withAlphaComponent(0.5)
        activityBgView?.frame = view.frame
        view.addSubview(activityBgView!)
        
        activityView = UIActivityIndicatorView(style: .white)
        activityView?.color = activityViewColor
        activityView?.center = activityBgView!.center
        activityBgView?.addSubview(activityView!)
        activityView?.startAnimating()
        
        let messageLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.textColor = messageColor
            label.text = message
            label.textAlignment = .center
            return label
        }()
        
        activityBgView?.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: activityView!.bottomAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: activityBgView!.leadingAnchor, constant: 15),
            messageLabel.centerXAnchor.constraint(equalTo: activityBgView!.centerXAnchor)
        ])
        
        if let duration = duration {
            DispatchQueue.main.asyncAfter(deadline: .now()+duration) {[weak self] in
                self?.hideActivityIndicator()
            }
        }
    }

    func hideActivityIndicator(){
        if activityView != nil{
            activityBgView?.removeFromSuperview()
            activityView?.stopAnimating()
        }
    }
}

extension DispatchQueue {
	static func mainAsyncIfNeeded(execute work: @escaping () -> Void) {
        Thread.isMainThread ? work() : main.async(execute: work)
	}
}
