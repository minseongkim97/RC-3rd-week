//
//  ViewController.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/05.
//

import UIKit

//MARK: - Data
public var writer: [String:String] = ["민법 강의":"김준호", "꼼꼼한 재은 씨의 스위프트 실전편":"이재은", "자료구조":"천인국, 공용해, 하상호", "마지막 몰입":"짐 퀵"]
public var bookContent: [String:String] = [
    "민법 강의":"민법은 어렵다",
    "마지막 몰입":"""
책 한 권 읽지 못했던 그는 어떻게 세계 최고의 두뇌력을 갖게 됐을까?

    UN, 하버드, 구글… 세계 1%가 극찬한 두뇌 전문가 짐 퀵이 전하는 잠재력의 놀랍고 위대한 힘!
    6년 전 스페이스X의 일론 머스크가 더 똑똑해지고 싶다는 열망에 한 두뇌 전문가를 찾아 큰 화제가 됐다. 그 전문가는 바로 ‘짐 퀵’이었다. 그는 25년 넘게 세계 정상급의 CEO와 운동선수, 배우 등 각계각층의 성공한 사람들뿐 아니라 UN, 미국 백악관, 하버드대학교, 구글, 나이키, 자포스 등 세계적 기업과 기관, 단체에서 찾는 독보적이고 저명한 브레인 코치다. 세계적인 경제지 《포브스》에서는 “짐 퀵은 지식을 배우거나 일을 하거나 취미로 운동을 하더라도 원하는 수준 이상의 성과를 이루는 법을 알려준다”고 평했다.

    짐 퀵은 나이, 배경, 교육, IQ에 상관없이 인간이라면 누구라도 뇌, 추진력, 기억력, 집중력, 습관의 한계를 넘을 수 있다고 주장한다. 이를 실현하기 위해 마인드셋, 동기부여, 방법 이 세 가지 영역을 아우르는 성공 전략을 직접 밝혀냈다. 특히 잠재력을 최대치로 끌어올릴 수 있는 짐 퀵만의 집중, 학습, 기억력, 속독, 사고 전략은 전 세계 195개국의 수억 명이 열광한 매우 효과적이고 널리 검증된 방법들로 그 핵심이 《마지막 몰입: 나를 넘어서는 힘》에 아낌없이 담겨 있다.

    짐 퀵이 주목받는 이유는 단순히 성공 전략만이 아니라 그의 극적인 인생 스토리에 있다. 어렸을 때 뇌를 크게 다쳐 평범한 학교생활과 학업이 어려웠던 그는 결국 대학교 중퇴를 결심한다. 책 한 권을 다 읽기 힘들 정도로 어떤 것을 배우고 익혀도 어려움을 겪자 자신의 인생에 한계를 느끼게 된 것이다. 그랬던 그가 ‘배우는 법’을 깊이 연구하고 파고들어 빌 게이츠, 일론 머스크, 버락 오바마, 오프라 윈프리 등 세계 상위 1%가 극찬한 최고의 두뇌 전문가가 되기까지 그의 인생을 바꾼 잠재력의 힘이 무엇인지 이 책을 통해 알게 될 것이다.
""",
    "스위프트 프로그래밍":"""
        문법을 넘어 프로그래밍 패러다임도 익히는 스위프트 5
        스위프트 5의 핵심 키워드는 ‘안정화’다. ABI 안정화 덕분에 버전과 환경에 크게 영향받지 않고 더 유연하게 스위프트를 사용할 수 있게 되었다. 최신 패러다임과 다양한 언어의 기능을 흡수하여 언어 전반에 걸쳐 안정화되었다. 기존 스위프트 업데이트의 주된 목적이 새로운 기능 추가였다면, 이번 스위프트 5는 비약적으로 발전한 기능을 세세하게 보정하고 다듬었다. 그렇다고 굵직한 변화가 없는 것은 아니다. 스위프트 언어의 발전은 여전히 현재 진행형이다.

        스위프트 프로그래밍 핵심 패러다임 기반으로 설명
        스위프트에는 함수형과 프로토콜 지향 프로그래밍 기법이 포함되어 있다. 이 책은 이 두 가지 패러다임에 맞춰 스위프트로 프로그래밍하는 방법을 설명한다. 스위프트 문법과 프로그래밍 패러다임을 함께 이 해하고 싶다면 이 책은 큰 도움이 될 것이다.
        """
]
public var allBooks: [Book] = [
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: ["기본 책장"]),
    Book(image: UIImage(named: "swift"), title: "스위프트 프로그래밍", writer: "야곰", category: ["FAVORITE"])
]
public var getLibrary: [String] = ["기본 책장", "FAVORITE"]
public var readingBooks: [Book] = []
public var viewIndex: Int = 0
public var clickedBook: String = ""

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
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
            contentvc.bookTitle = allBooks[content].title
            contentvc.modalPresentationStyle = .fullScreen
            self.present(contentvc, animated: true)

            if !readingBooks.contains(where: {$0.title == allBooks[content].title}) {
                readingBooks.append(allBooks[content])
                readingBooksView.tableView.reloadData()
            }
            
    
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
            
            readingBooks.removeAll(where: {$0.title == allBooks[content].title})
            allBooks.remove(at: content)

            print(readingBooks)
            readingBooksView.tableView.reloadData()
            
        
            
            DispatchQueue.main.async {
                self.numLabel.text = "보유한 책 \(allBooks.count)권"
                allBooksView.tableView.reloadData()
            }
        }))
            
        present(alert, animated: true)

    }
    
    func moveVCFromReadingBooksView(to content: Int) {
        let contentvc = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        contentvc.bookTitle = readingBooks[content].title
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
