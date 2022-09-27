//
//  CartViewController.swift
//  FinalProject
//
//  Created by user on 26.09.2022.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView!
    
    private var cartItems = [GameItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cart"

        cartTableView.delegate = self
        cartTableView.dataSource = self
        self.cartTableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        
//        NetworkManager.makeRequest(page: 1) { [weak self] results in
//            switch results {
//            case .success(let games):
//                print("request have been made")
//                self?.cartItems.append(games?.results?[0] ?? GameResponseModel())
//            case .failure(let error):
//                print(error)
//            }
//        }
        fetchDataFromLocalStorage()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("Add to cart"), object: nil, queue: nil) { _ in
            self.fetchDataFromLocalStorage()
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.cartTableView.reloadData()
        }
    }
    
    func fetchDataFromLocalStorage() {
        CoreDataManager.shared.fetchGamesFromDatabase { [weak self] result in
            switch result {
            case .success(let games):
                self?.cartItems = games
                self?.cartTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as? CartTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .systemBackground
        for item in cartItems {
            cell.configure(model: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(cartItems[indexPath.row].name ?? "")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            CoreDataManager.shared.deleteItem(with: cartItems[indexPath.row]) { [weak self] result in
                switch result {
                case .success(): print("\(self?.cartItems[indexPath.row].name ?? "") deleted from cart")
                case .failure(let error):
                    print(error)
                }
                self?.cartItems.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        default:
            break
        }
    }
    
}
