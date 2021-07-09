//
//  ContentViewController.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/06.
//

import UIKit

class ContentViewController: UIViewController{
    

    

    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    var bookTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTitleLabel.text = bookTitle
        contentLabel.text = data.bookContent[bookTitle]
        bookTitleLabel.minimumScaleFactor = 0.5
        bookTitleLabel.adjustsFontSizeToFitWidth = true
   
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {        dismiss(animated: true)
    }
    

}
