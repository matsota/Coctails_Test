//
//  CategoryTableViewCell.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 18.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    //MARK: - Implementation
    private var isFiltering = Bool()
    private var name = String()

    //MARK: Label
    @IBOutlet private weak var categoryLabel: UILabel!
    
    //MARK: Image
    @IBOutlet private weak var isFilteringImage: UIImageView!
    //    checkmark.seal
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    //MARK: - Filling
    func fill(name: String, isFiltering: Bool) {
        self.name = name
        categoryLabel.text = self.name
        
        self.isFiltering = isFiltering
        
        if self.isFiltering == true {
            isFilteringImage.isHidden = false
        }else{
            isFilteringImage.isHidden = true
        }
    }
}
