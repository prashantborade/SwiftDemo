//
//  DrawLineBetweenTwoAddressVC.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 6/18/18.
//  Copyright © 2018 Avion. All rights reserved.
//

import UIKit
import MapKit

//custom class for pin
class CustomPin:NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTittle:String,pinSubTitle:String,location:CLLocationCoordinate2D) {
        
        self.title = pinTittle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}


class DrawLineBetweenTwoAddressVC: UIViewController , MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    //Mark: - Mapkit Delegates
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
