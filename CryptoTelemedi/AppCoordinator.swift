//
//  AppCoordinator.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 21/11/2021.
//

import UIKit

enum CoordinatorPresentationStyle {
    case push
    case root
}

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
}

class BaseCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController = UINavigationController()
    
    open func start() {
        fatalError("Start method must be implemented")
    }
    
    func start(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
 
class AppCoordinator: BaseCoordinator {
    override func start() {
        let coordinator = CurrencyListingCoordinator()
        coordinator.navigationController = navigationController
        start(coordinator: coordinator)
    }
}
