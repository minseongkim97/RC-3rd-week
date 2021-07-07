//
//  EachLibraryViewController.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/05.
//

import UIKit

class EachLibraryViewController: UIViewController {
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var numLabel: UILabel!
    
    var eachLibraryView = EachLibraryView.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryView.addSubview(eachLibraryView)
        NSLayoutConstraint.activate([
            eachLibraryView.topAnchor.constraint(equalTo: categoryView.topAnchor),
            eachLibraryView.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor),
            eachLibraryView.trailingAnchor.constraint(equalTo: categoryView.trailingAnchor),
            eachLibraryView.bottomAnchor.constraint(equalTo: categoryView.bottomAnchor)
        ])

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        categoryName.text = eachCategoryVCName
        numLabel.text = "보유한 책 \(categoryBook.count)권"
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
        categoryBook = []
    }
    
}
