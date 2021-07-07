//
//  ViewController.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/05.
//

import UIKit

//MARK: - Data
public var writer: [String:String] = ["민법 강의":"김준호", "꼼꼼한 재은 씨의 스위프트 실전편":"이재은", "자료구조":"천인국, 공용해, 하상호"]
public var bookContent: [String:String] = ["민법 강의":"민법은 어렵다"]
public var allBooks: [Book] = [
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: ["기본 책장"]),
    Book(image: UIImage(named: "swift"), title: "스위프트 프로그래밍", writer: "야곰", category: ["FAVORITE"])
]
public var getLibrary: [String] = ["기본 책장", "FAVORITE"]
public var readingBooks: [Book] = []
public var viewIndex: Int = 0
//MARK: - Public Property
var readingBooksView = ReadingBooksView.shared
var allBooksView = AllBooksView.shared
var libraryView = LibraryView.shared
var eachLibraryView = EachLibraryView.shared
public var categoryBook: [Book] = []
public var eachCategoryVCName: String = ""


class ViewController: UIViewController, CustomSegmentedControlDelegate, LibraryViewDelegate, AllBooksViewDelegate, ReadingBooksViewDelegate  {
    
    
    //MARK: - Property
    let defaults = UserDefaults.standard
    @IBOutlet weak var viewToDisplay: UIView!
    @IBOutlet weak var numLabel: UILabel!
    
    //MARK:- Lifecycle
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
        readingBooksView.delegate = self
        allBooksView.delegate = self
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 110, width: self.view.frame.width, height: 50), buttonTitle: ["읽고 있는 책","책장","모든 책"])
        codeSegmented.delegate = self
        codeSegmented.backgroundColor = .clear
        view.addSubview(codeSegmented)
    }
    
    //MARK: - Action
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "책 추가", message: "책 제목을 정확히 입력해주세요", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "책 제목 입력"
        }
        alert.addAction(UIAlertAction(title: "취소", style: .default))
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: { _ in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    allBooks.append(Book(image: UIImage(named: text) ?? UIImage(systemName: "book"), title: text, writer: writer[text] ?? "", category: []))
                    DispatchQueue.main.async {
                        if viewIndex == 2 {
                            self.numLabel.text = "보유한 책 \(allBooks.count)권"
                        }
                        allBooksView.tableView.reloadData()
                    }
                }
            }
        }))
        present(alert, animated: true)
    }
    
    @IBAction func addLibraryButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "책장 추가", message: "책장 이름을 정확히 입력해주세요", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "책장 이름 입력"
        }
        alert.addAction(UIAlertAction(title: "취소", style: .default))
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: { _ in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    getLibrary.append(text)
                    DispatchQueue.main.async {
                        if viewIndex == 1 {
                            self.numLabel.text = "보유한 책장 \(getLibrary.count)개"
                        }
                        libraryView.tableView.reloadData()
                    }
                }
            }
        }))
        present(alert, animated: true)
    }
    
    
    //MARK: - Function
    func moveVC(to category: String) {
        eachLibraryView.tableView.reloadData()
        let eachLibraryvc = storyboard?.instantiateViewController(withIdentifier: "EachLibraryViewController") as! EachLibraryViewController
        
        eachCategoryVCName = category
        eachLibraryvc.modalPresentationStyle = .fullScreen
        present(eachLibraryvc, animated: true)
        
    }
    
    
    func moveVCFromAllBooksView(to content: Int) {

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
 
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "책 읽기", style: .default, handler: { _ in
            
         
            let contentvc = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
            contentvc.modalPresentationStyle = .fullScreen
            self.present(contentvc, animated: true)

            
        
            readingBooks.append(allBooks[content])
            readingBooksView.tableView.reloadData()
    
        }))
        
        alert.addAction(UIAlertAction(title: "책장에 넣기", style: .default, handler: { _ in
            
            let libraryAlert = UIAlertController(title: "책장 선택", message: "책장을 선택해주세요", preferredStyle: .actionSheet)
            for library in getLibrary {
                libraryAlert.addAction(UIAlertAction(title: library, style: .default, handler: { _ in
                    if !allBooks[content].category.contains(library) {
                        allBooks[content].category.append(library)
                    }
                }))
            }
            libraryAlert.addAction(UIAlertAction(title: "취소", style: .cancel))
            self.present(libraryAlert, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive, handler: { _ in
            allBooks.remove(at: content)
            DispatchQueue.main.async {
                self.numLabel.text = "보유한 책 \(allBooks.count)권"
                allBooksView.tableView.reloadData()
            }
        }))
            
        present(alert, animated: true)

    }
    
    func moveVCFromReadingBooksView(to content: Int) {
        let contentvc = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        contentvc.modalPresentationStyle = .fullScreen
        present(contentvc, animated: true)
    }
    
    
    func change(to index: Int) {
        viewIndex = index
        if index == 0 {
            print(viewIndex)
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
            print(viewIndex)
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
            print(viewIndex)
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
    

}
