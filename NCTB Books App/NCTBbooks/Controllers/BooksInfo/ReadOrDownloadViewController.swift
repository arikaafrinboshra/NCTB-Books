//
//  ReadOrDownloadViewController.swift
//  NCTBbooks
//
//  Created by Sharif Rafi on 3/3/20.
//  Copyright © 2020 Sharif Rafi. All rights reserved.
//

import UIKit

class ReadOrDownloadViewController: UIViewController {
    
    @IBOutlet weak var groupOfBooksName: UILabel!
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var selectedBooksImage: UIImageView!
    @IBOutlet weak var readButtonOutlet: UIButton!
    @IBOutlet weak var downloadButtonOutlet: UIButton!
    
    
    var bookImageString: String = String()
    var bookName: String = String()
    var classNameOfBook: String = String()
    var bookUrl: String = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        readButtonOutlet.layer.cornerRadius = 10
        readButtonOutlet.layer.borderWidth = 1
        readButtonOutlet.layer.borderColor = UIColor.green.cgColor
        downloadButtonOutlet.layer.cornerRadius = 10
        
        self.groupOfBooksName.text = bookName
        self.className.text = classNameOfBook
        gettingBookImage()
    }
    
    func gettingBookImage() {
        let imageURL = URL(string: bookImageString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        UIImage.getImage(url: imageURL, completion: { (image) in
            self.selectedBooksImage.image  = image
        })
    }

    @IBAction func readButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "PdfReaderViewController") as! PdfReaderViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.booksUrl = bookUrl
        
    }
    
    
    @IBAction func downloadButton(_ sender: Any) {
        
        guard let url = URL(string: bookUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else { return }
                
        let urlSession = URLSession(configuration: .default, delegate: self as URLSessionDelegate, delegateQueue: OperationQueue())
                
            let downloadTask = urlSession.downloadTask(with: url)
                downloadTask.resume()
    }
}


    
extension ReadOrDownloadViewController:  URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    let path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    let newURL = path.appendingPathComponent("newPDF")
    try! FileManager.default.moveItem(at: location, to: newURL)

        print("downloadLocation:", location)
        print("newLocation:", newURL)
    }
}
