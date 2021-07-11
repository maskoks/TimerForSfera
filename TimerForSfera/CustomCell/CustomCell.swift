//
//  CustomCell.swift
//  TimerForSfera
//
//  Created by Жеребцов Данил on 08.07.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let timerLabel = UILabel()
    
    let pauseImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: "cellID")
        contentView.addSubview(timerLabel)
        contentView.addSubview(pauseImage)
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setConstraints() {
        
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        pauseImage.translatesAutoresizingMaskIntoConstraints = false
    
        timerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        timerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        timerLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        pauseImage.trailingAnchor.constraint(equalTo: timerLabel.leadingAnchor, constant: -10).isActive = true
        pauseImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        pauseImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        pauseImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
}
