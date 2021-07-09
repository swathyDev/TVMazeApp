//
//  ListCollectionViewCell.swift
//  TVMazeApp
//
//  Created by Dev on 09/07/21.
//

import UIKit
import SDWebImage

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var ratingsStarImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    
    func setupCellWith(_ model: ShowList?){
        titleLabel.text = model?.name ?? ""
        iconImageView?.sd_setImage(with: URL(string: model?.image?.original ?? ""), placeholderImage: nil)
        ratingLabel.text = "\(model?.rating?.average ?? 0)"
    }
}
