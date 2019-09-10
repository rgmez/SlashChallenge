//
//  ResultTableViewCell.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 05/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstPlayerLabel: TitleLabel!
    @IBOutlet weak var secondPlayerLabel: TitleLabel!
    @IBOutlet weak var firstScoreLabel: HighLabel!
    @IBOutlet weak var secondScoreLabel: HighLabel!
    @IBOutlet weak var dateLabel: SecondaryLabel!
    
    func configure(with item: ResultItemInterface) {
    
        firstPlayerLabel.text = item.firstPlayerName
        secondPlayerLabel.text = item.secondPlayerName
        firstScoreLabel.text = item.firstPlayerScore
        secondScoreLabel.text = item.secondPlayerScore
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        if let date = item.date {
            dateLabel.text = dateFormatter.string(from: date)
        }
    }
}
