//
//  DrinkListViewController.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 18.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import UIKit

class DrinkListViewController: UIViewController {
    
    //MARK: - Override
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if CoreDataManager.shared.entityIsEmpty() {
            DrinkLibraryManager.shared.loadCategoryList(success: { (categories) in
                for i in categories {
                    CoreDataManager.shared.saveCategories(category: i.strCategory, isFiltering: true)
                }
                self.categories = CoreDataManager.shared.fetchCategories(failure: { (error) in
                    self.alertAboutCoreDataError(method: "entityIsEmpty : true : fetchCategories", error: error)
                })
                self.categories?.sort { (a, b) -> Bool in
                    guard let a = a.category?.lowercased(), let b = b.category?.lowercased() else {return false}
                    return a < b
                }
                self.tableView.reloadData()
            }) { (error) in
                self.alertAboutConnectionLost(method: "entityIsEmpty : true : loadCategoryList", error: error)
            }
        }else{
            self.categories = CoreDataManager.shared.fetchCategories(failure: { (error) in
                 self.alertAboutCoreDataError(method: "entityIsEmpty:false : fetchCategories", error: error)
            })
            self.categories?.removeAll(where: { (i) -> Bool in
                !i.isFiltering
            })
            self.categories?.sort { (a, b) -> Bool in
                guard let a = a.category?.lowercased(), let b = b.category?.lowercased() else {return false}
                return a < b
            }
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DRINKS"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DrinkTableViewCell.nib(), forCellReuseIdentifier: NavigationCases.Transition.DrinkTVCell.rawValue)
}
    
    
    //MARK: - Implementation
    private var categories: [CategoryEntity]?,
    filteredCategories: [CategoryEntity]?,
    searchActivity = false
    
    //MARK: Table View
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: Search Bar
    @IBOutlet private weak var searchBar: UISearchBar!
    
}









//MARK: - Extension
//MARK: - Search Result
extension DrinkListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filteredCategories = categories?.filter({ (data) -> Bool in
                searchActivity = true
                return data.category?.lowercased().contains(searchText.lowercased()) ?? false
            })
            self.tableView.reloadData()
        }else{
            searchBar.placeholder = "Search category"
            self.searchActivity = false
            self.tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.placeholder = "Search category"
        tableView.reloadData()
    }
    
}

//MARK: Table View
extension DrinkListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchActivity {
            return filteredCategories?.count ?? 0
        }
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NavigationCases.Transition.DrinkTVCell.rawValue, for: indexPath) as! DrinkTableViewCell
        
        var fetch: CategoryEntity?
        
        if searchActivity {
            fetch = self.filteredCategories?[indexPath.row]
        }else{
            fetch = self.categories?[indexPath.row]
        }
    
        guard let category = fetch?.category, let isFiltering = fetch?.isFiltering else {return cell}
        
        cell.fill(category: category, isFiltering: isFiltering)
        return cell
    }
    
}
