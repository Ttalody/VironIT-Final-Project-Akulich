//
//  GamePresentationViewController.swift
//  FinalProject
//
//  Created by user on 20.09.2022.
//

import UIKit
import SDWebImage

class GameDetailViewController: UIViewController {
    
    private var game: GameResponseModel = GameResponseModel()
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public func configure(with model: GameResponseModel) {
        // gameImage.sd_setImage(with: URL(string: model.backgroundImage ?? ""), completed: nil)
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
