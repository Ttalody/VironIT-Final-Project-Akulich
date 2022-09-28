//
//  GamePresentationViewController.swift
//  FinalProject
//
//  Created by user on 20.09.2022.
//

import UIKit
import SDWebImage

class GameDetailViewController: UIViewController {
    
    private let gameImage: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let gameNameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
//    @IBOutlet weak var gameImage: UIImageView!
//    @IBOutlet weak var gameNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(gameImage)
        view.addSubview(gameNameLabel)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gameNameLabel.frame = CGRect(x: view.center.x, y: view.center.y, width: 200, height: 40)
        gameImage.frame = CGRect(x: view.frame.origin.x + 5, y: view.frame.origin.y + 5, width: view.bounds.width - 20, height: 240)
    }
    
    public func configure(with model: GameDetailViewModel) {
        gameImage.sd_setImage(with: URL(string: model.imageUrl ?? ""), completed: nil)
        gameNameLabel.text = model.name
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
