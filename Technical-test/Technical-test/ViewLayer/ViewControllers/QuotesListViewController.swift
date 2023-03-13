//
//  QuotesListViewController.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import UIKit

class QuotesListViewController: UIViewController {
    /// ViewModels
    private lazy var viewModel: QuotesListInterface = QuotesListViewModel()
    
    /// Data Properties
    private var data: Array<PresentationModel.Quote> = Array() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    /// UI Properties
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.register(QuotesListViewCell.self, forCellReuseIdentifier: QuotesListViewCell.identifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUIComponents()
        
        viewModel.observeData = { result in
            switch result {
            case .success(let data):
                self.data = data
                print(data)
            case .failure(let failure):
                print(failure)
            }
        }
        
        viewModel.fetchQuotes()
    }
    
    private func initUIComponents() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func openQuoteDetail(quite: PresentationModel.Quote) {
        let vc = QuoteDetailsViewController(quote: quite)
        present(vc, animated: true)
    }
}

extension QuotesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuotesListViewCell.identifier, for: indexPath)
        
        let data = data[indexPath.row]
        let configurator = QuitesListViewConfigurator(model: data)
        cell.contentConfiguration = configurator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.data[indexPath.row]
        openQuoteDetail(quite: data)
    }
}
