//
//  CollectionViewTableViewCell.swift
//  FinalProject
//
//  Created by user on 07.09.2022.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: AnyObject {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: GameDetailViewModel)
}

class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    
    weak var delegate: CollectionViewTableViewCellDelegate?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 260, height: 180)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.identifier)
        return collectionView
    }()
    
    private var games: [GameResponseModel] = [GameResponseModel]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
//    public func isConfigured() -> Bool {
//        return [self.games].count > 0
//    }
    
    private func addToCartAt(indexPath: IndexPath) {
        print("adding the \(games[indexPath.row].name ?? "")")
        
        CoreDataManager.shared.addItem(with: games[indexPath.row]) { result in
            switch result {
            case .success():
                NotificationCenter.default.post(name: NSNotification.Name("Add to cart"), object: nil)
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    func configure(with games: [GameResponseModel]) {
        self.games = games
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

// MARK: Extensions

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as? GameCollectionViewCell else { return UICollectionViewCell()}
        let model = games[indexPath.row]
        cell.backgroundColor = .systemBackground
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(games[indexPath.row].name ?? "no name")
        let game = games[indexPath.row]
        delegate?.collectionViewTableViewCellDidTapCell(self, viewModel: GameDetailViewModel(id: game.id,
                                                                                             name: game.name,
                                                                                             releaseDate: game.releaseDate,
                                                                                             imageUrl: game.backgroundImage,
                                                                                             rating: game.rating,
                                                                                             ratingsCount: game.ratingsCount,
                                                                                             metacriticRating: game.metacriticRating,
                                                                                             screenshots: game.screenshots,
                                                                                             platforms: game.platforms))
        
//        DispatchQueue.main.async {
//            let viewController = GameDetailViewController()
//            viewController.configure(with: self.games[indexPath.row])
//            
//            
//        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil,
                                                previewProvider: nil) { [weak self] _ in
            let addToCartAction = UIAction(title: "Add to cart", image: nil, identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                self?.addToCartAt(indexPath: indexPath)
            }
            return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [addToCartAction])
        }
        
        return config
    }
    
}
