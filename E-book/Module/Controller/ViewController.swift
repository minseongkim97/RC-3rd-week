//
//  ViewController.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/05.
//

import UIKit

public var allBooks: [Book] = [
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: "기본 책장"),
    Book(image: UIImage(named: "swift"), title: "스위프트 프로그래밍", writer: "야곰", category: ""),
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: "기본 책장"),
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: "기본 책장"),
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: "기본 책장"),
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: "기본 책장"),
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: "기본 책장")
]

public var getLibrary: [String] = ["기본 책장", "FAVORITE"]

public var readingBooks: [Book] = [
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: "")
]

public var rowsToDisplay = readingBooks
var readingBooksView = ReadingBooksView.shared
var allBooksView = AllBooksView.shared
var libraryView = LibraryView.shared
public var categoryBook: [Book] = []
public var eachCategoryVCName: String = ""


class ViewController: UIViewController, CustomSegmentedControlDelegate, LibraryViewDelegate  {
    
    func moveVC(to category: String) {
       
        for book in allBooks {
            if book.category == category {
                categoryBook.append(book)
            }
        }
        
        let eachLibraryvc = storyboard?.instantiateViewController(withIdentifier: "EachLibraryViewController") as! EachLibraryViewController
        
        eachCategoryVCName = category
        eachLibraryvc.modalPresentationStyle = .fullScreen
        present(eachLibraryvc, animated: true)
        
    }
    
    
    func change(to index: Int) {
        if index == 0 {
            numLabel.text = "읽고 있는 책 \(readingBooks.count)권"
            viewToDisplay.addSubview(readingBooksView)
            NSLayoutConstraint.activate([
                readingBooksView.topAnchor.constraint(equalTo: viewToDisplay.topAnchor),
                readingBooksView.leadingAnchor.constraint(equalTo: viewToDisplay.leadingAnchor),
                readingBooksView.trailingAnchor.constraint(equalTo: viewToDisplay.trailingAnchor),
                readingBooksView.bottomAnchor.constraint(equalTo: viewToDisplay.bottomAnchor)
            ])

            readingBooksView.tableView.reloadData()
        }
        
        else if index == 1 {
            numLabel.text = "보유한 책장 \(getLibrary.count)개"
            viewToDisplay.addSubview(libraryView)
            NSLayoutConstraint.activate([
                libraryView.topAnchor.constraint(equalTo: viewToDisplay.topAnchor),
                libraryView.leadingAnchor.constraint(equalTo: viewToDisplay.leadingAnchor),
                libraryView.trailingAnchor.constraint(equalTo: viewToDisplay.trailingAnchor),
                libraryView.bottomAnchor.constraint(equalTo: viewToDisplay.bottomAnchor)
            ])

            libraryView.tableView.reloadData()
        }
        
        else {
            numLabel.text = "보유한 책 \(allBooks.count)권"
            viewToDisplay.addSubview(allBooksView)
            NSLayoutConstraint.activate([
                allBooksView.topAnchor.constraint(equalTo: viewToDisplay.topAnchor),
                allBooksView.leadingAnchor.constraint(equalTo: viewToDisplay.leadingAnchor),
                allBooksView.trailingAnchor.constraint(equalTo: viewToDisplay.trailingAnchor),
                allBooksView.bottomAnchor.constraint(equalTo: viewToDisplay.bottomAnchor)
            ])

            allBooksView.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var viewToDisplay: UIView!
    
    
    @IBOutlet weak var numLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        numLabel.text = "읽고 있는 책 \(readingBooks.count)권"
        viewToDisplay.addSubview(readingBooksView)
        NSLayoutConstraint.activate([
            readingBooksView.topAnchor.constraint(equalTo: viewToDisplay.topAnchor),
            readingBooksView.leadingAnchor.constraint(equalTo: viewToDisplay.leadingAnchor),
            readingBooksView.trailingAnchor.constraint(equalTo: viewToDisplay.trailingAnchor),
            readingBooksView.bottomAnchor.constraint(equalTo: viewToDisplay.bottomAnchor)
        ])
    
        libraryView.delegate = self
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 110, width: self.view.frame.width, height: 50), buttonTitle: ["읽고 있는 책","책장","모든 책"])
        codeSegmented.delegate = self
        codeSegmented.backgroundColor = .clear
        view.addSubview(codeSegmented)
    }

}
