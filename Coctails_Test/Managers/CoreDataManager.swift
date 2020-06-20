//
//  CoreDataManager.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 20.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
}




///
//MARK: - Crud
///
extension CoreDataManager {
    
    //MARK: - For Category
    func saveCategories(category: String, isFiltering: Bool) {
        let employee = CategoryEntity(context: PersistenceService.context)
        
        employee.category = category
        employee.isFiltering = isFiltering
        PersistenceService.saveContext()
    }
    
}

///
//MARK: - cRud
///
extension CoreDataManager {
    
    //MARK: - For Category
    func fetchCategories(failure: @escaping(NSError) -> Void) -> [CategoryEntity]? {
        let fetchRequest: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
        
        do {
            let result = try PersistenceService.context.fetch(fetchRequest)
            return result
        }catch let error as NSError{
            failure(error)
            return nil
        }
    }
    
    func entityIsEmpty() -> Bool {
        let fetchRequest: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()

        let results: NSArray? = try? PersistenceService.context.fetch(fetchRequest) as NSArray
        if let res = results{
            if res.count == 0 {
                return true
            }else{
                return false
            }
        }else{
            return true
        }
    }
    
}
