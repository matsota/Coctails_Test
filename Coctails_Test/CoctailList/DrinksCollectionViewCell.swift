//
//  DrinksCollectionViewCell.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 19.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import UIKit

class DrinksCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Implementation
    
    //MARK: Label
    @IBOutlet private weak var drinkNameLabel: UILabel!
    
    //MARK: ImageView
    @IBOutlet private weak var drinkImageView: UIImageView!
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    /// Call nib method
    static func nib() -> UINib {
        return UINib(nibName: "DrinksCollectionViewCell", bundle: nil)
    }
    
    //MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.startAnimating()
    }
    
    
    //MARK: - Fill the Cell
    func fill(name: String, imageURL: String) {
        if let url = NSURL(string: imageURL) {
            if let data = NSData(contentsOf: url as URL){
                drinkImageView.image = UIImage(data: data as Data)
                activityIndicator.stopAnimating()
            }else{
                activityIndicator.stopAnimating()
            }
        }else{
            activityIndicator.stopAnimating()
        }
        drinkNameLabel.text = name
    }
    
}
