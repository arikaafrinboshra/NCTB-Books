//
//  PdfReaderViewController.swift
//  NCTBbooks
//
//  Created by Sharif Rafi on 3/3/20.
//  Copyright © 2020 Sharif Rafi. All rights reserved.
//

import UIKit
import PDFKit

class PdfReaderViewController: UIViewController {
    var booksUrl: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.ShowSpinner()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false){
            (t) in
            self.RemoveSpinner()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let pdfView = PDFView()
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        //pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pdfView.autoScales = true
        
        let pdfUrl = URL(string: booksUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        
        if let document = PDFDocument(url: pdfUrl) {
            pdfView.document = document
        }
    }
}
