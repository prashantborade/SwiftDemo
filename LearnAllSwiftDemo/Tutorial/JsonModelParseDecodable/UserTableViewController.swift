
//
//  UserTableViewController.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 5/30/18.
//  Copyright © 2018 Avion. All rights reserved.


import UIKit
import Alamofire
import SwiftyJSON

enum Weekday: String {
    case Monday  = "Monday"
    case Tuesday = "Tuesday"
    case Wensday   = "Wensday"
    case Thursday  = "Thursday"
    case Friday = "Friday"
    case Satuarday = "Satuarday"
    case Sunday = "Sunday"
    case Month
    // ... and so on ...
}
class UserTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate
{

    @IBOutlet weak var btnMonSelected_Outlet: UIButton!
    @IBOutlet weak var userTableView: UITableView!
    var myResponse : JSON = JSON.null
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        callAPI(URL: webConstant.USERS_URL)
        // Do any additional setup after loading the view.
        
        
       
        let date = Date()
        
        print(date.dayOfWeek()!)
        
        setWeekdayinSting(today: date.dayOfWeek()!)
    }
    func setWeekdayinSting(today: String)
    {
        switch today {
        case Weekday.Monday.rawValue:
           
            self.btnMonSelected_Outlet.setImage(UIImage(named: "m_selected"), for: .normal)
           break
        case Weekday.Tuesday.rawValue:
            
            self.btnMonSelected_Outlet.setImage(UIImage(named: "t_selected"), for: .normal)
            break
        case Weekday.Wensday.rawValue:
            
            self.btnMonSelected_Outlet.setImage(UIImage(named: "t_selected"), for: .normal)
            break
        case Weekday.Thursday.rawValue:
            
            self.btnMonSelected_Outlet.setImage(UIImage(named: "m_selected"), for: .normal)
            break
        case Weekday.Friday.rawValue:
            self.btnMonSelected_Outlet.setImage(UIImage(named: "m_selected"), for: .normal)
            break
        case Weekday.Satuarday.rawValue:
            self.btnMonSelected_Outlet.setImage(UIImage(named: "m_selected"), for: .normal)
            break
        case Weekday.Sunday.rawValue:
            self.btnMonSelected_Outlet.setImage(UIImage(named: "m_selected"), for: .normal)
            break
        default:
            
            break
        }
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func callAPI(URL: String)
    {
        let url = NSURL(string:URL)
        let request = NSMutableURLRequest(url:url! as URL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(request as URLRequest).responseJSON { (response) in
        
            switch response.result {
                
            case.success(let data) :
                
                print("response data",data)
                
                self.myResponse = JSON(data)
                
                for i in 0..<self.myResponse.count
                {
                    let singleUser = User(userJSON:self.myResponse[i])
                    
                    self.users.append(singleUser)
                    
                    print(self.users[i].address.city)
                    
                    self.userTableView.reloadData()
                    
                }
                
            case.failure(let error):
                
                print("response failure ",error)
                
        }
       
            
            
            
        }
    
    }

    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return users.count
     }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
      let userCellID = "UserCell"
      let cell = tableView.dequeueReusableCell(withIdentifier: userCellID, for: indexPath) as! UserCell
    
    //configure cell
    cell.lblName.text = " Name:\(users[indexPath.row].name)"
    cell.lblEmail.text = " Email:\(users[indexPath.row].email)"
    cell.lblPhone.text = "Phone No:\(users[indexPath.row].phone)"
    cell.lblUserName.text = "User Name:\(users[indexPath.row].userName)"
    cell.lblAddress.text = "Phnoe:\(users[indexPath.row].phone), UserName:\(users[indexPath.row].userName)"
    
    return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 180.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        
    }

}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}
