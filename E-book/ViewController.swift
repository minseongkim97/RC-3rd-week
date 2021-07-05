//
//  ViewController.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/05.
//

import UIKit

public var getBooks: [Book] = [
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: ""),
    Book(image: UIImage(named: "swift"), title: "스위프트 프로그래밍", writer: "야곰", category: "")
]

public var getLibrary: [String:[Book]] = ["기본 책장":[]]

public var readingBooks: [Book] = [
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: "")
]

var rowsToDisplay = readingBooks


class ViewController: UIViewController, CustomSegmentedControlDelegate {
    
    func change(to index: Int) {
        if index == 0 {
            numLabel.text = "읽고 있는 책 \(readingBooks.count)권"
            rowsToDisplay = readingBooks
            ebookTableView.reloadData()
        }
        
        else if index == 1 {
            numLabel.text = "보유한 책장 \(getLibrary.count)개"
        }
        
        else {
            numLabel.text = "보유한 책 \(getBooks.count)권"
            rowsToDisplay = getBooks
            ebookTableView.reloadData()
        }
    }
    

    @IBOutlet weak var ebookTableView: UITableView! {
        didSet {
            self.ebookTableView.delegate = self
            self.ebookTableView.dataSource = self
        }
    }
    
    @IBOutlet weak var numLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numLabel.text = "읽고 있는 책 \(rowsToDisplay.count)권"
        ebookTableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "bookCell")
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 110, width: self.view.frame.width, height: 50), buttonTitle: ["읽고 있는 책","책장","모든 책"])
        codeSegmented.delegate = self
        codeSegmented.backgroundColor = .clear
        view.addSubview(codeSegmented)
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rowsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
    
        cell.bookImage.image = rowsToDisplay[indexPath.row].image
        cell.titleLabel.text = rowsToDisplay[indexPath.row].title
        cell.writerLabel.text = rowsToDisplay[indexPath.row].writer
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
