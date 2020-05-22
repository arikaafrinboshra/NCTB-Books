//
//  headerTableViewCell.swift
//  NCTBbooks
//
//  Created by Sharif Rafi on 25/2/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

var listCounter:Int = 0
var listNameArray = [String]()
var listImageArray = [String]()


class TopCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var indecator: UIImageView!
    
    
    override func awakeFromNib() {
        print()
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setExpanded() {
        indecator.image = UIImage(systemName: "chevron.down")
    }
    
    func setCollapsed(){
        indecator.image = UIImage(systemName: "chevron.right")
    }
}
