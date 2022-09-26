//
//  SearchHeaderView.swift
//  FinalProject
//
//  Created by user on 21.09.2022.
//

import UIKit

class SearchHeaderView: UIView {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = CGRect(x: 10, y: 10, width: bounds.width, height: 40)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
