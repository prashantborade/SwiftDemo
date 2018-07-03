//
//  MenuHomeVC.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 6/20/18.
//  Copyright © 2018 Avion. All rights reserved.
//

import UIKit

class MenuHomeVC: UIViewController {

    // URL Video : https://www.youtube.com/watch?v=Tr5JjxnE8yU
    var menu_vc : MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   menu_vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
      
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondsToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondsToGesture))
          swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        
    }
        
    @objc func respondsToGesture(gesture : UISwipeGestureRecognizer)
    {
        
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("swipe right")
            show_menu()
        case UISwipeGestureRecognizerDirection.left:
            print("swipe left")
            close_on_swipe()
        default:
            break
        }
        
    }
    func close_on_swipe() {
        
        if AppDelegate.menu_bool{
            
            //show menu
            //show_menu()
        } else
        {
            //close menu
            close_menu()
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menu_Action(_ sender: UIBarButtonItem) {

        if AppDelegate.menu_bool{
            
            //show menu
            show_menu()
        } else
        {
            //close menu
            close_menu()
            
        }
    }
    
    func show_menu()  {
        
        UIView.animate(withDuration: 0.3) {
            
            self.menu_vc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self.addChildViewController(self.menu_vc)
            self.view.addSubview(self.menu_vc.view)
            AppDelegate.menu_bool = false
        }
       
    }
    
    func close_menu() {
        
        UIView.animate(withDuration: 0.3, animations: {
           self.menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finished) in
            
           self.menu_vc.view.removeFromSuperview()
        }
       
        AppDelegate.menu_bool = true
        
    }
}
