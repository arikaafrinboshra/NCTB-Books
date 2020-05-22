//
//  contentTableViewCell.swift
//  NCTBbooks
//
//  Created by Sharif Rafi on 25/2/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class DownCell: UITableViewCell {

    @IBOutlet weak var bookImages: UIImageView!

    @IBOutlet weak var contentLbl: UILabel!
    
    @IBOutlet weak var classLabel: UILabel!
    //   @IBOutlet weak var bookImage: UIImageView!
//    @IBOutlet weak var contentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
