//
//  CartTableViewCell.swift
//  FinalProject
//
//  Created by user on 08.09.2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"
    
    private let gameImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.frame = CGRect(x: 10, y: 0, width: 200, height: 120)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let gameLabelName: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 200, y: 0, width: 100, height: 120)
        label.textColor = .label
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemBlue
        addSubview(gameImageView)
//        addGradient()
        addSubview(gameLabelName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    func configure(model: GameResponseModel) {
        if let url = URL(string: model.backgroundImage ?? "") {
            gameImageView.sd_setImage(with: url, completed: nil)
        }
        gameLabelName.text = model.name
    }
}
