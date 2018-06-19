//
//  CoreDataHandler.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 6/12/18.
//  Copyright © 2018 Avion. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    class func saveObject(userName: String,password:String) -> Bool{
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Student", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        
        manageObject.setValue(userName, forKey: "userName")
        manageObject.setValue(password, forKey: "password")
        
        do {
            try context.save()
            return true
        }catch {
                
                return false
            }
    }
    //fetch data
    class func fetchObject() -> [Student]? {
        
        let  context = getContext()
        let user:[Student]? = nil
        
        do {
            let user = try context.fetch(Student.fetchRequest())
            return user as? [Student]
        }catch{
            return user
       }
    }
    
    class func deleteObject(user: Student) -> Bool {
        
        let context = getContext()
        context.delete(user)
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
        
    }
    
    // clean delete
    
    class func cleanDelete() -> Bool {
     
      let context = getContext()
      let delete = NSBatchDeleteRequest(fetchRequest: Student.fetchRequest())
        
        do {
            
            try context.execute(delete)
            return true
        }catch {
            return false
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
