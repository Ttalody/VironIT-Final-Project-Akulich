//
//  GameCollectionViewCell.swift
//  FinalProject
//
//  Created by user on 19.09.2022.
//

import UIKit
import SDWebImage

class GameCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GameCollectionViewCell"
    
    private let gameImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(gameImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gameImageView.frame = contentView.bounds
    }
    
    public func configure(with model: GameResponseModel) {
        guard let url = URL(string: model.backgroundImage!) else { return }
        gameImageView.sd_setImage(with: url, completed: nil)
    }
}
