


//
//  CountryTableView.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 6/13/18.
//  Copyright © 2018 Avion. All rights reserved.
//

import UIKit
import Alamofire

struct Country:Decodable {
    
    let name: String
    let capital:String
   
    
}



class CountryTableView: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var countryTable: UITableView!
    var countires = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string:"https://restcountries.eu/rest/v2/all")
        Alamofire.request(url!).responseJSON { (response) in
            
            let result = response.data
            do {
                self.countires = try JSONDecoder().decode([Country].self, from: result!)
                
                for country in self.countires
                {
                   self.countires.append(country)
                   
                    DispatchQueue.main.async {
                        
                        self.countryTable.reloadData()
                    }
                }
                
            } catch {
                
                print(error)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countires.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let userCellID = "CustomCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: userCellID, for: indexPath) as! CustomCell
        
        cell.textLabel?.text = self.countires[indexPath.row].name
        cell.detailTextLabel?.text = self.countires[indexPath.row].capital
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
    
}
