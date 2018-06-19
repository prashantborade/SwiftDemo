//
//  User.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 5/30/18.
//  Copyright © 2018 Avion. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


class User {
    
    var name=String()
    var email=String()
    var phone=String()
    var userName=String()
    var address:Address
    
    init(userJSON:JSON) {
        
        self.name = userJSON["name"].stringValue
        self.email = userJSON["email"].stringValue
        self.phone = userJSON["phone"].stringValue
        self.userName = userJSON["username"].stringValue
        self.address = Address(addressJSON:userJSON["address"])
        
    }
    
}

class Address {
    
    var street = String()
    var suite = String()
    var city = String()
    
    init(addressJSON:JSON) {
        
        self.street = addressJSON["street"].stringValue
        self.suite = addressJSON["suite"].stringValue
        self.city = addressJSON["city"].stringValue
        
    }
    
}
