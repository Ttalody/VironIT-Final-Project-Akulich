//
//  ScreenshotCollectionViewCell.swift
//  FinalProject
//
//  Created by user on 29.09.2022.
//

import UIKit

class ScreenshotCollectionViewCell: UICollectionViewCell {
    static let identifier = "ScreenshotCollectionViewCell"
    
    private let gameImageView: UIImageView = {
       let imageView = UIImageView()
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
    
    func configureScreenshotCell(with url: String) {
        guard let url = URL(string: url) else { return }
        gameImageView.sd_setImage(with: url, completed: nil)
    }
}
