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
    case none
}

class Coordinator: NSObject {
    private final weak var supercoordinator: Coordinator?
    private final var subcoordinators = Set<Coordinator>()
    private final var presentationStyle: CoordinatorPresentationStyle = .none
    
    final let viewController: UIViewController
    
    final var navigationController: UINavigationController? {
        return viewController as? UINavigationController ??
            viewController.navigationController ??
            supercoordinator?.viewController.navigationController
    }
    
    final func start(coordinator: Coordinator? = nil) {
        if let coordinator = coordinator {
            subcoordinators.insert(coordinator)
        }
        coordinator?.navigationController?.delegate = coordinator
    }
    
    final func start(coordinator: Coordinator,
                     presentationStyle: CoordinatorPresentationStyle,
                     animated: Bool = true) {
        coordinator.presentationStyle = presentationStyle
        
        switch presentationStyle {
        case .push:
            navigationController?.pushViewController(coordinator.viewController, animated: animated)
        case .root:
            navigationController?.delegate = coordinator
            navigationController?.setViewControllers([coordinator.viewController], animated: animated)
        
            subcoordinators.removeAll()
        default: break
        }
        start(coordinator: coordinator)
    }
    
    init(viewController: UIViewController = UINavigationController(), supercoordinator: Coordinator? = nil) {
        self.supercoordinator = supercoordinator
        self.viewController = viewController
        super.init()
    }
    
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        let finalize = { [weak self] in
            self?.subcoordinators.removeAll()
            completion?()
            self?.removeFromSupercoordinator()
        }
        
        switch presentationStyle {
        case .push:
            navigationController?.popViewController(animated: animated)
            finalize()
        default:
            finalize()
        }
    }
    
    private final func pop(coordinator: Coordinator) {
        subcoordinators.remove(coordinator)
        coordinator.navigationController?.delegate = self
    }
    
    private final func findCoordinator(forViewController viewController: UIViewController) -> Coordinator? {
        weak var supercoordinator: Coordinator? = self.supercoordinator
        while let coordinator = supercoordinator {
            if viewController === coordinator.viewController {
                return coordinator
            }
            supercoordinator = coordinator.supercoordinator
        }
        return nil
    }
    
    private func removeFromSupercoordinator() {
        supercoordinator?.pop(coordinator: self)
    }
}

extension Coordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let coordinator = findCoordinator(forViewController: viewController) {
            coordinator.subcoordinators.removeAll()
        }
    }
}

extension Coordinator: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        subcoordinators.removeAll()
    }
}

class AppCoordinator: Coordinator {
    func startMainCoordinator() {
        let loadVC = CurrencyListingViewController()
        let viewModel = CurrencyListingViewModel(manager: CurrencyListingManager())
        loadVC.viewModel = viewModel
        viewModel.delegate = loadVC
        
        let coordinator = CurrencyListingCoordinator(viewController: loadVC, supercoordinator: self)
        loadVC.coordinator = coordinator
        
        self.start(coordinator: coordinator, presentationStyle: .root, animated: false)
    }
}
