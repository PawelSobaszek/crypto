//
//  AlertHelper.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 23/11/2021.
//

import UIKit

protocol AlertHelper { }
extension AlertHelper where Self: UIViewController {

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(okAction)

        DispatchQueue.main.async {
            self.view?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func tryAgainAlert(title: String, message: String, tryAgainOption: @escaping () -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in }
        alertController.addAction(okAction)

        let tryAgainAction = UIAlertAction(title: "Try again", style: .default) { _ in
            tryAgainOption()
        }
        alertController.addAction(tryAgainAction)

        DispatchQueue.main.async {
            self.view?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
