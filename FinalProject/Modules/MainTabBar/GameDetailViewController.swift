//
//  GamePresentationViewController.swift
//  FinalProject
//
//  Created by user on 20.09.2022.
//

import UIKit
import SDWebImage

class GameDetailViewController: UIViewController {
    
//    private let gameImage: UIImageView = {
//       let imageView = UIImageView()
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//    
//    private let gameNameLabel: UILabel = {
//       let label = UILabel()
//        label.font = .systemFont(ofSize: 22, weight: .regular)
//        return label
//    }()
    private var game: GameDetailViewModel?
    private var name = ""
    private var rating = ""
    private var metacritic = ""
    private var platforms = [String]()
    private var imageUrls = [String]()
    
    @IBOutlet var screenshotCollectionView: UICollectionView!
    @IBOutlet var platformsLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var metacriticLabel: UILabel!
    @IBOutlet var addToCartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        view.addSubview(gameImage)
//        view.addSubview(gameNameLabel)
//        gameImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        addToCartButton.layer.cornerRadius = 15
        
        screenshotCollectionView.delegate = self
        screenshotCollectionView.dataSource = self
        screenshotCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ScreenshotCollectionViewCell.identifier)
        
        ratingLabel.text = rating
        metacriticLabel.text = metacritic
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(screenshotCollectionView)
    }
    
    func configure(with model: GameDetailViewModel) {
        game = model
        navigationController?.title = model.name
        rating = String(model.rating!)
        metacritic = String(model.metacriticRating!)
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

extension GameDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let game = game {
            return game.screenshots.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotCollectionViewCell.identifier, for: indexPath) as? ScreenshotCollectionViewCell else { return UICollectionViewCell()}
        cell.configureScreenshotCell(with: game?.imageUrl ?? "")
        cell.backgroundColor = .green
        return cell
    }
    
}
