//
//  CoreDataTableView.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 6/12/18.
//  Copyright © 2018 Avion. All rights reserved.
//

import UIKit
import Foundation

class CoreDataTableView: UITableViewController {

    var user:[Student]? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

       CoreDataHandler.saveObject(userName: "nice", password: "data")
        user = CoreDataHandler.fetchObject()
        
        
        for i in user! {
            
            print(i.userName!)
        }
        // single delete object
        
        user = CoreDataHandler.fetchObject()
        
        print("Before single delete")
        
        for i in user! {
            
            print(user!.count)
            print(i.userName!)
        }
        
        if CoreDataHandler.deleteObject(user: user![1]){
            
            user = CoreDataHandler.fetchObject()
            
            print("After single Delete")
            
            for i in user! {
                
                print(user!.count)
                print(i.userName!)
            }
        }
        
        // clean Delete
        
        if CoreDataHandler.cleanDelete() {
            
            user = CoreDataHandler.fetchObject()
            
            print(user!)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return user!.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCellID = "CoreDataCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: userCellID)
        
        let data = user![indexPath.row]
        cell?.textLabel?.text = data.userName! + " and " + data.password!
        return cell!
    }

   

}
