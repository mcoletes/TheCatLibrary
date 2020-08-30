//
//  ViewControllerErrorProtocol.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

protocol ViewControllerErrorProtocol {
    func displayError(message: String, actionButtonTitle: String?, tryAgainAction: EmptyClosure?)
}

extension ViewControllerErrorProtocol where Self: UIViewController  {
    func displayError(message: String, actionButtonTitle: String?, tryAgainAction: EmptyClosure?) {
        let alertController = UIAlertController(title:Text.warningTitle.value, message: message, preferredStyle: .alert)

        if let action = tryAgainAction {
            let okAction = UIAlertAction(title: actionButtonTitle, style: .default) {
                UIAlertAction in
               action()
            }
             alertController.addAction(okAction)
        }

        let cancelAction = UIAlertAction(title: Text.warningButtonDismissTitle.value, style: .cancel)

        alertController.addAction(cancelAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
