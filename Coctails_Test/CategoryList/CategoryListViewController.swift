//
//  CategoryListViewController.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 18.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import UIKit

class CategoryListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.categories = CoreDataManager.shared.fetchCategories(failure: { (error) in
             self.alertAboutCoreDataError(method: "entityIsEmpty:false : fetchCategories", error: error)
        })
        self.categories?.sort { (a, b) -> Bool in
            guard let a = a.category?.lowercased(), let b = b.category?.lowercased() else {return false}
            return a < b
        }
    }
    
    //MARK: - Implementation
    private var categories: [CategoryEntity]?

    //MARK: Table View
    @IBOutlet private weak var tableView: UITableView!
    
}









//MARK: - Extention
extension CategoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NavigationCases.Transition.CategoryTVCell.rawValue, for: indexPath) as! CategoryTableViewCell
        
        guard let fetch = categories?[indexPath.row], let name = fetch.category else {return cell}
        let isFiltering = fetch.isFiltering
        
        cell.fill(name: name, isFiltering: isFiltering)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.categories?[indexPath.row].isFiltering == true {
            self.categories?[indexPath.row].isFiltering = false
        }else{
            self.categories?[indexPath.row].isFiltering = true
        }
        self.tableView.reloadData()
        
    }
    
    
}
