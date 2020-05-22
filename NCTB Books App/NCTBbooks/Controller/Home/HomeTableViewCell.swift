//  HomeViewController.swift
//  NCTBbooks
//  Created by Sharif Rafi on 25/2/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var categoryLabel: UILabel!
    var myViewController: HomeViewController!
    var tableViewset:UITableView?
    
    var closure: ((_ indexPathRow: Int) -> Void)?
    
    var counter:Int?
    var nameArray = [String]()
    var imageArray = [String]()
    var urlArray = [String]()
    var taskbookcategory:BookCategory?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //self.tableViewset?.reloadData()
    }

    
    public func configureMethodForHomeTableViewCell(with json:BookCategory, tableViewme:UITableView){
        nameArray.removeAll()
        imageArray.removeAll()
        urlArray.removeAll()
        
        taskbookcategory = json
        counter = Int(json.books?.count ?? 0)
       // print("Counter:", counter)
     
        tableViewset = tableViewme
        for i in 0...counter! - 1{

            nameArray.append(json.books![i].name ?? "")
            imageArray.append(json.books![i].imageURL ?? "")
            urlArray.append(json.books![i].fileURL ?? "")
        }
        
    }
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return counter ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        let imageString = imageArray[indexPath.row]
        let imageUrlString = URL(string: imageString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        
        UIImage.getImage(url: imageUrlString, completion: { (image) in
            
            cell.homeCollectionImageView.image = image
        })
        
        cell.homeCollectionLabel.text = nameArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //print ("faul")
        return CGSize(width: (self.bounds.size.width / 2.8), height: (250))
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        closure?(indexPath.row)
    }
    
    override func prepareForReuse() {
           super.prepareForReuse()
         
        print("inside !!!")
        DispatchQueue.main.async {
            self.homeCollectionView.reloadData()
        }
       }
    
}

//Not Needed
extension HomeTableViewCell{
    
    func centerItemsInCollectionView(cellWidth: Double, numberOfItems: Double, spaceBetweenCell: Double, collectionView: UICollectionView) -> UIEdgeInsets {
        let totalWidth = cellWidth * numberOfItems
        let totalSpacingWidth = spaceBetweenCell * (numberOfItems - 1)
        let leftInset = (collectionView.frame.width - CGFloat(totalWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}


extension UIImage {
    
    static func downloadImage(url: URL, completion: @escaping(_ image: UIImage?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, responseUrl, error in
            var downloadedImage: UIImage?
            
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            
            DispatchQueue.main.async {
                completion(downloadedImage)
            }
        }.resume()
    }
    
}
