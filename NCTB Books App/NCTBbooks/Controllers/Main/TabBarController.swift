//
//  TabBarController.swift
//  NCTBbooks
//
//  Created by Sharif Rafi on 11/3/20.
//  Copyright © 2020 Sharif Rafi. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    @IBOutlet weak var customTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customTabBar.unselectedItemTintColor = UIColor.lightText

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
