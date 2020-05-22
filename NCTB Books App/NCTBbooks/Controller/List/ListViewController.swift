//
//  ListViewController.swift
//  NCTBbooks
//
//  Created by Sharif Rafi on 25/2/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTbleView: UITableView!
    
    var dataModel = [ResponseForList]()
    var subjectModel = [BookSubject]()

    var listCounter:Int?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()
        self.ShowSpinner()
              Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false){
                  (t) in
        self.RemoveSpinner()
        }
    }
    
    func getDataFromServer(){
        guard let url = URL(string: "http://103.192.157.61:84/api/Book/GetAllBookListGroupBySubject") else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, error == nil {
                    do {
                        let json = try JSONDecoder().decode(ResponseForList.self, from: data)
                        
                        for i in 0...(json.payload!.count) - 1{
                        self.subjectModel.append(json.payload![i])
                        }

                        DispatchQueue.main.async {
                            self.listTbleView.reloadData()
                        }
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return subjectModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectModel[section].isCollups ? (1 + (subjectModel[section].books?.count ?? 0)) : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell: TopCell = self.listTbleView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath) as! TopCell
            
            cell.titleLbl.text = subjectModel[indexPath.section].subject
            if subjectModel[indexPath.section].isCollups{
                cell.setExpanded()
            } else{
                cell.setCollapsed()
            }
            
            
            cell.backgroundColor = UIColor.white
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 10
            cell.clipsToBounds = true
            return cell
        }
        else {
            let cell: DownCell = self.listTbleView.dequeueReusableCell(withIdentifier: "downcell", for: indexPath) as! DownCell
            
            
            cell.contentLbl.text = subjectModel[indexPath.section].books![indexPath.row - 1].name ?? ""
            cell.classLabel.text = "( " + (subjectModel[indexPath.section].books![indexPath.row - 1].category ?? "") + " )"
           
            let imgString = subjectModel[indexPath.section].books![indexPath.row - 1].imageURL ?? ""
            let imgUrlString = URL(string: imgString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
            
            UIImage.getImage(url: imgUrlString, completion: { (image) in
                cell.bookImages.image = image
            })
            
            cell.backgroundColor = UIColor.white
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 2
            cell.layer.cornerRadius = 10
            cell.clipsToBounds = true
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8.0
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInRow section: Int) -> CGFloat {
    return 8.0
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if indexPath.row == 0 {
            return (view.frame.height / 11)
        }
         else{
            return (view.frame.height / 7)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            for i in 0...subjectModel.count-1{
                if i == indexPath.section{
                    subjectModel[indexPath.section].isCollups = !subjectModel[indexPath.section].isCollups
                }
                else{
                    subjectModel[i].isCollups = false
                }
                tableView.reloadData()
                //tableView.reloadSections([i], with: .automatic)
            }
        }
            
        else {
            //let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReadOrDownloadViewController") as! ReadOrDownloadViewController
            self.navigationController?.pushViewController(vc, animated: true)
            let listImageString = subjectModel[indexPath.section].books![indexPath.row - 1].imageURL ?? ""
            vc.bookImageString = listImageString
            vc.bookName = subjectModel[indexPath.section].books![indexPath.row - 1].name ?? ""
            vc.classNameOfBook = subjectModel[indexPath.section].books![indexPath.row - 1].category ?? ""
            vc.bookUrl = subjectModel[indexPath.section].books![indexPath.row - 1].fileURL ?? ""
        }
    }
}
