//
//  HomeCollectionViewCell.swift
//  NCTBbooks
//
//  Created by Sharif Rafi on 25/2/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var homeCollectionLabel: UILabel!
    
    @IBOutlet weak var homeCollectionImageView: UIImageView!
    
    override func prepareForReuse() {
          super.prepareForReuse()
          homeCollectionImageView.image = nil
          homeCollectionLabel.text = nil
      }
   
    
}
