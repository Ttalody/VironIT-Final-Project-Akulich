//
//  CartTableViewCell.swift
//  FinalProject
//
//  Created by user on 26.09.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let identifier = "CartTableViewCell"

    let gameImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.frame = CGRect(x: 10, y: 0, width: 200, height: 120)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let gameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 200, y: 0, width: 100, height: 120)
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
//    @IBOutlet weak var gameImageView: UIImageView!
//    @IBOutlet weak var gameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.textLabel?.textColor = .systemRed
    }

    public func configure(model: GameItem) {
        guard let imageUrl = URL(string: model.backgroundImage ?? "") else { return }
        gameImageView.sd_setImage(with: imageUrl, completed: nil)
        gameLabel.text = model.name
    }
    
}
