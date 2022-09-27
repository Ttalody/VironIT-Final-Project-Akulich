//
//  HomeViewController.swift
//  FinalProject
//
//  Created by user on 07.09.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = {
        var arr = [String]()
        for genre in Genres.allCases {
            arr.append(genre.rawValue)
        }
        return arr
    }()
    
    @IBOutlet weak var homeTable: UITableView!
    @IBOutlet weak var profileNavBarButton: UIButton!
    @IBOutlet weak var settingsNavBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(homeTable)
        
        self.homeTable.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        
        homeTable.delegate = self
        homeTable.dataSource = self
        
        let headerView = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        
        homeTable.tableHeaderView = headerView
        
//        getGames()
        
//        var urlComponents = URLComponents(string: APIConstants.baseURL + APIConstants.games)
//        
//        urlComponents!.queryItems =
//            [URLQueryItem(name: APIConstants.key, value: APIConstants.APIKey)]
//
//        let url = String(describing: urlComponents!.url)
//        print(url)
//        
//        NetworkManager.makeRequest(page: 0) { _ in
//            
//        }
        
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTable.frame = view.bounds
    }

    private func getGames() {
        APICaller.shared.getGamesData { _ in
            
        }
    }
    
    @IBAction func profileButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toProfileSugue", sender: self)
    }
    
    @IBAction func unwindToHome(for: UIStoryboardSegue, sender: Any?) {}
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Genres.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .secondarySystemBackground
        cell.delegate = self
        for index in sectionTitles.indices where index == indexPath.section {
                print("request for \(sectionTitles[index])")
                NetworkManager.makeGenreRequest(genre: sectionTitles[index].lowercased(), pageSize: 5) { result in
                    switch result {
                    case .success(let games):
                        cell.configure(with: games?.results ?? [GameResponseModel]())
                    case .failure(let error):
                        print(error)
                    }
                }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .label
        header.textLabel?.text = header.textLabel?.text?.lowercased().capitalized
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: GameResponseModel) {
        DispatchQueue.main.async { [weak self] in
            let viewController = GameDetailViewController()
            viewController.gameNameLabel?.text = viewModel.name
//            viewController.configure(with: viewModel)
//            self?.navigationController?.pushViewController(viewController, animated: true)
            self?.performSegue(withIdentifier: "detailSegue", sender: self)
        }
    }
    
}
