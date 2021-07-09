//
//  SeasonCollectionViewCell.swift
//  TVMazeApp
//
//  Created by Dev on 09/07/21.
//

import UIKit

class SeasonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var customView: UIView!
    @IBOutlet var numberLabel: UILabel!
    
    
    func setupCellWith(_ index: Int?){
        numberLabel.text = String(index ?? 0)
        customView.layer.cornerRadius = 25
        customView.layer.masksToBounds = false
    }
}
