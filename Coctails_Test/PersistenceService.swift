//
//  PersistenceService.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 20.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import Foundation
import CoreData


class PersistenceService {
    
    private init() {}
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Coctails_Test")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: - Delete entity data by name
    static func clearEntityByName(entity: String, success: @escaping() -> Void, failure: @escaping(NSError) -> Void) {
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
           fetchRequest.returnsObjectsAsFaults = false
           do {
               let results = try PersistenceService.context.fetch(fetchRequest)
               for managedObject in results {
                   let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                   PersistenceService.context.delete(managedObjectData)
                   PersistenceService.saveContext()
               }
               success()
           }catch let error as NSError{
            print("Detele all data in \(entity) error : \(error) \(error.localizedDescription)")
            failure(error)
           }
       }
}

