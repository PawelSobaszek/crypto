//
//  CurrencyListingViewController.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 21/11/2021.
//

import UIKit

protocol CurrencyListingViewControllerDelegate: LoadingStateHelper, AlertHelper {
    func reloadTable()
}

final class CurrencyListingViewController: LoadingStateHelper {
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!
    
    var coordinator: CurrencyListingCoordinatorDelegate?
    var viewModel: CurrencyListingViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupNaviBar()
        setupSearchBar()
        setupTableView()
        
        viewModel?.fetchCurrency()
    }
    
    private func setupNaviBar() {
        title = "Currency listing"
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "CurrencyTableViewCell", bundle: nil), forCellReuseIdentifier: CurrencyTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CurrencyListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as! CurrencyTableViewCell
        let model = viewModel?.currency[indexPath.row]
        if let model = model {
            cell.configure(currency: model)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.currency.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchBar.resignFirstResponder()
        coordinator?.openCurrencyDetails(id: viewModel?.getCurrencyId(indexPath: indexPath) ?? 0)
    }
}

extension CurrencyListingViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.searchCurrency(searchText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
}

extension CurrencyListingViewController: CurrencyListingViewControllerDelegate {
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

