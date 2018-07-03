//
//  MenuViewController.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 6/20/18.
//  Copyright © 2018 Avion. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var menuTableView: UITableView!
    
    let title_arr = ["Home","About us","Rate us ","share","Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    // TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return title_arr.count;
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        
        cell.lblMenu.text = title_arr[indexPath.row]
        
        return cell
        
    }
    
    // TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    

    

}
