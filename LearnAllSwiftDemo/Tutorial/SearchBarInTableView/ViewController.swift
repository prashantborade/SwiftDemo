//
//  ViewController.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 5/24/18.
//  Copyright © 2018 Avion. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate
{
    
    @IBOutlet weak var tabBar: UITabBar!
   
    @IBOutlet weak var tabBarItemSunday: UITabBarItem!
    
    @IBOutlet weak var tabBarItemMonday: UITabBarItem!
    @IBOutlet weak var tabBarItemTuesday: UITabBarItem!
    @IBOutlet weak var tabBarItemWensday: UITabBarItem!
    @IBOutlet weak var tabBarItemThursday: UITabBarItem!
    @IBOutlet weak var tabBarItemFriday: UITabBarItem!
    @IBOutlet weak var tabBarItemSaturday: UITabBarItem!
    
    
    var selected : Bool = false
    var selectedArray: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var fruitsArray = [Fruit]()
    var currentFuritArray = [Fruit]() //  to setup table
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpFruits()
        setUpSearchBar()
        alterLayout()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tabBar.backgroundImage = UIImage(named:"Strawberry")
        self.tabBarItemSunday.image = UIImage(named:"s.png")
        self.tabBarItemMonday.image = UIImage(named:"m_selected.png")
        self.tabBarItemTuesday.image = UIImage(named:"w_selected")
        self.tabBarItemWensday.image = UIImage(named:"w")
        self.tabBarItemThursday.image = UIImage(named:"t_selected")
        self.tabBarItemFriday.image = UIImage(named:"f")
        self.tabBarItemSaturday.image = UIImage(named:"s_selected")
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func setUpFruits() {
        
        //        ["Apple", "Pineapple", "Orange", "Blackberry", "Banana", "Pear", "Kiwi", "Strawberry", "Mango", "Walnut", "Apricot", "Tomato", "Almond", "Date", "Melon", "Water Melon", "Lemon", "Coconut", "Fig", "Passionfruit", "Star Fruit", "Clementin", "Citron", "Cherry", "Cranberry"]
        
        // fruit1
        fruitsArray.append(Fruit(name: "Apple", category: .fruit1 ,image: "Apple"))
        fruitsArray.append(Fruit(name: "Pineapple", category: .fruit1 ,image: "Pineapple"))
        fruitsArray.append(Fruit(name: "Orange", category: .fruit1 ,image: "Orange"))
        fruitsArray.append(Fruit(name: "Blackberry", category: .fruit1 ,image: "Blackberry"))
        fruitsArray.append(Fruit(name: "Banana", category: .fruit1 ,image: "Banana"))
        fruitsArray.append(Fruit(name: "Pear", category: .fruit1 ,image: "Pear"))
        fruitsArray.append(Fruit(name: "Kiwi", category: .fruit1 ,image: "Kiwi"))
        fruitsArray.append(Fruit(name: "Strawberry", category: .fruit1 ,image: "Strawberry"))
        
        // fruit2
        
        fruitsArray.append(Fruit(name: "Mango", category: .fruit2 ,image: "Mango"))
        fruitsArray.append(Fruit(name: "Walnut", category: .fruit2 ,image: "Walnut"))
        fruitsArray.append(Fruit(name: "Apricot", category: .fruit2 ,image: "Apricot"))
        fruitsArray.append(Fruit(name: "Tomato", category: .fruit2 ,image: "Tomato"))
        fruitsArray.append(Fruit(name: "Almond", category: .fruit2 ,image: "Almond"))
        fruitsArray.append(Fruit(name: "Date", category: .fruit2 ,image: "Date"))
        fruitsArray.append(Fruit(name: "Coconut", category: .fruit2 ,image: "Coconut"))
        fruitsArray.append(Fruit(name: "Passionfruit", category: .fruit2 ,image: "Passionfruit"))
        fruitsArray.append(Fruit(name: "Cherry", category: .fruit2 ,image: "Cherry"))
        fruitsArray.append(Fruit(name: "Citron", category: .fruit2 ,image: "Citron"))
        fruitsArray.append(Fruit(name: "Lemon", category: .fruit2 ,image: "Lemon"))
        
        currentFuritArray = fruitsArray
        
        for _ in currentFuritArray {
          
            let idex = "0"
            self.selectedArray.append(idex)
        }
     }
    
    private func setUpSearchBar() {
        
        searchBar.delegate = self
    }
    
    func alterLayout() {
        
        tableView.tableHeaderView = UIView()
        //Search Bar in section Header
      //  tableView.estimatedSectionHeaderHeight = 50
        //Search Bar in naviagtion Bar
        navigationItem.titleView = searchBar
        // hide scopeBar
        //searchBar.showsScopeBar = false
        
        
    }

    // UITableview Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentFuritArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath) as? FruitCell else
        {
            return UITableViewCell()
        }
        
    
       
        cell.lblName.text = currentFuritArray[indexPath.row].name
        cell.lblCategory.text = currentFuritArray[indexPath.row].category.rawValue
        cell.imageView?.image = UIImage(named : currentFuritArray[indexPath.row].image)
        
        
        if self.selectedArray[indexPath.row] == "1"
        {
            
            cell.backgroundColor = UIColor.red
        }
        else
        {
            cell.backgroundColor = UIColor.clear
        }
       
        return cell
    }
    
    // UITableview delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let important = importantAction(at: indexPath)
        //let delete = deleteAction(at: indexPath)
       
        return UISwipeActionsConfiguration(actions: [important])
        
    }

    @available(iOS 11.0, *)
    func importantAction(at indexPath: IndexPath) -> UIContextualAction
    {
      
        
        let action = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in

            self.selected = true

//            let cell = self.tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath) as! FruitCell
//            cell.backgroundColor = UIColor.red
//           
//        
//           print(indexPath.row)
//            self.selectedArray.append(self.currentFuritArray[indexPath.row].name)
//            print(self.selectedArray)
              print(self.selectedArray)
            let cell:FruitCell = (self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)))! as! FruitCell
            self.selectedArray.remove(at: indexPath.row)
            self.selectedArray.insert("1", at: indexPath.row)
            
            print(self.selectedArray)
            
           
            self.tableView.reloadData()
            completion(true)
        }
        
        action.image = #imageLiteral(resourceName: "checked_wht")
        action.backgroundColor = UIColor.green
        
        return action
    }
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = deleteAction(at: indexPath)
        
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    @available(iOS 11.0, *)
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction
    {
        let action = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in
//        self.currentFuritArray.remove(at: indexPath.row)
//        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
            let cell:FruitCell = (self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)))! as! FruitCell
            self.selectedArray.remove(at: indexPath.row)
            self.selectedArray.insert("0", at: indexPath.row)
            cell.backgroundColor = UIColor.clear
            self.tableView.reloadData()
        completion(true)
        }
    
            action.image = #imageLiteral(resourceName: "checked_wht")
            action.backgroundColor = UIColor.black
        
        return action
    }
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let userTableVC = UserTableViewController()
     
    }
    
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        return self.searchBar
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//
//        return UITableViewAutomaticDimension
//    }
    // called when text changes (including clear)
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        currentFuritArray = fruitsArray.filter({ (fruit) -> Bool in
            
            switch searchBar.selectedScopeButtonIndex {
                
            case 0:
                if searchText.isEmpty { return true }
                return fruit.name.lowercased().contains(searchText.lowercased())
                
            case 1:
                if searchText.isEmpty { return fruit.category == .fruit1 }
                
                return fruit.name.lowercased().contains(searchText.lowercased()) &&
                fruit.category == .fruit1
                
            case 2:
                if searchText.isEmpty { return fruit.category == .fruit2 }
                
                return fruit.name.lowercased().contains(searchText.lowercased()) &&
                    fruit.category == .fruit2
            default:
                
                return false
                
            }
        })
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int)
    {
    
        switch selectedScope {
        
        case 0:
        
         currentFuritArray = fruitsArray
            
        case 1:
        
            currentFuritArray = fruitsArray.filter({ (fruit) -> Bool in
                
                fruit.category == FruitType.fruit1
            })
        case 2:
            
            currentFuritArray = fruitsArray.filter({ (fruit) -> Bool in
                
                fruit.category == FruitType.fruit2
            })
            
        default:
          break
        }
        
        tableView.reloadData()
        
    }

}


class Fruit {
    
    let name: String
    let image: String
    let category: FruitType
    
    init(name: String, category: FruitType, image: String) {
        
        self.name = name
        self.image = image
        self.category = category
        
    }
    
}

enum FruitType : String {
    case fruit1 = "fruit"
    case fruit2 = "Vegitable"
}
