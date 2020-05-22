//
//  ActivityIndicator.swift
//  Activity Indicator On Any ViewController
//
//  Created by Admin on 1/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

var ActivityView : UIView?

extension UIViewController{
    
    func  ShowSpinner(){
        
        ActivityView = UIView(frame: self.view.bounds)
        ActivityView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        
        activityIndicator.center = ActivityView!.center
        activityIndicator.startAnimating()
        ActivityView?.addSubview(activityIndicator)
        self.view.addSubview(ActivityView!)
        
        //Auto remove call
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false){
             (t) in
            self.RemoveSpinner()
        }
    }
    
    
    func  RemoveSpinner(){
        
        ActivityView?.removeFromSuperview()
        ActivityView = nil
    }
    
}
