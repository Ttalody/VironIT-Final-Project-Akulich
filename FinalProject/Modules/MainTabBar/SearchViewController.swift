//
//  CartViewController.swift
//  FinalProject
//
//  Created by user on 08.09.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchController = UISearchController()
    
    private var games: [GameResponseModel] = [GameResponseModel]()
    
    @IBOutlet weak var searchTable: UITableView!

//    private let searchTable: UITableView = {
//        let table = UITableView(frame: .zero, style: .grouped)
//        table.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
//        return table
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        searchController.definesPresentationContext = true
        
//        view.addSubview(searchTable)
        
        self.searchTable.register(GamePreviewTableViewCell.self, forCellReuseIdentifier: GamePreviewTableViewCell.identifier)
        
        searchTable.delegate = self
        searchTable.dataSource = self
        
//        let headerView = SearchHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
//
//        searchTable.tableHeaderView = headerView
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTable.frame = view.bounds
    }

    public func configure(with games: [GameResponseModel]) {
        self.games = games
        DispatchQueue.main.async { [weak self] in
            self?.searchTable.reloadData()
        }
    }
}

// MARK: TableView extension

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GamePreviewTableViewCell.identifier, for: indexPath) as? GamePreviewTableViewCell else {
            return UITableViewCell()
        }
        let game = games[indexPath.row]
        cell.backgroundColor = .systemBackground
        
        cell.configure(model: GameViewModel(name: game.name ?? "", imageUrl: game.backgroundImage))
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        60
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        "Search"
//    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        header.textLabel?.textColor = .white
        header.textLabel?.frame = CGRect(x: view.bounds.origin.x + 10, y: view.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.text = header.textLabel?.text?.lowercased().capitalized
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchTable.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let defaultOffset = view.safeAreaInsets.top
//        let offset = scrollView.contentOffset.y + defaultOffset
//
//        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
//    }
}

extension SearchViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else { return }
        
        NetworkManager.makeSearchRequest(text: text) { results in
            switch results {
            case .success(let result):
                print("search request")
                self.configure(with: result?.results ?? [GameResponseModel]())
                print(results)
            case .failure(let error):
                print(error)
            }
        }
        
        searchController.dismiss(animated: true, completion: nil)
    }
}

extension SearchViewController: UISearchBarDelegate {
    
}
