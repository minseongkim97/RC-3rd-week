//
//  ContentViewController.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/06.
//

import UIKit

class ContentViewController: UIViewController{
    

    

    @IBOutlet weak var bookTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {        dismiss(animated: true)
    }
    

}
