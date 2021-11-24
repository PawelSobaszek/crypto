//
//  LoadingStateHelper.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 23/11/2021.
//

import UIKit

class LoadingStateHelper: UIViewController {
    func setLoadingState(isLoading: Bool) {
        isLoading ? showSpinner(onView: self.view) : removeSpinner()
    }
}
