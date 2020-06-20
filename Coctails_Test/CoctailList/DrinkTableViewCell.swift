//
//  DrinkTableViewCell.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 19.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import UIKit
import Alamofire


class DrinkTableViewCell: UITableViewCell {
    //MARK: - Implementation
    private var drinks = [Drink]()
    private var category = String()
    private var request: Request?
    
    //MARK: Label
    @IBOutlet weak var categoryLabel: UILabel!
    
    //MARK: Collection View
    @IBOutlet weak var collectionView: UICollectionView!
    
    /// Call nib method
    static func nib() -> UINib {
        return UINib(nibName: "DrinkTableViewCell", bundle: nil)
    }
    
    //MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DrinksCollectionViewCell.nib(), forCellWithReuseIdentifier: NavigationCases.Transition.DrinksCVCell.rawValue)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func prepareForReuse() {
        request?.cancel()
        request = nil
    }
    
    //MARK: - Fill
    func fill (category: String, isFiltering: Bool) {
            self.category = category
            categoryLabel.text = self.category
            
            request = DrinkLibraryManager.shared.loadDrinksList(category: category, success: { (data) in
                self.drinks = data
                self.collectionView.reloadData()
            }) { (error) in
                print("ERROR: DrinkListViewController / DELEGATE: loadDrinksList", error.localizedDescription)
            }
        }
    
}




//MARK: - Extention
extension DrinkTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NavigationCases.Transition.DrinksCVCell.rawValue, for: indexPath) as! DrinksCollectionViewCell,
        
        fetch = self.drinks[indexPath.row],
        
        name = fetch.strDrink,
        imageURL = fetch.strDrinkThumb
        
        cell.fill(name: name, imageURL: imageURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height,
        width = height * 0.8
        return CGSize(width: width, height: height)
    }
    
    
}
