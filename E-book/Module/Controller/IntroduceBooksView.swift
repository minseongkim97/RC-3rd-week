//
//  AllBooksView.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/05.
//

import UIKit

public var introduceIndex: [IndexPath] = []

protocol IntroduceBooksViewDelegate: AnyObject {
    func introduce(content: IndexPath)
}

class IntroduceBooksView: UIView {

    static let shared = IntroduceBooksView()

    weak var delegate: IntroduceBooksViewDelegate?
   

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "IntroduceBookTableViewCell", bundle: nil), forCellReuseIdentifier: "introduceCell")
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    func setupView() {
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}

extension IntroduceBooksView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allBooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "introduceCell", for: indexPath) as! IntroduceBookTableViewCell

        cell.bookImage.image = allBooks[indexPath.row].image
        cell.titleLabel.text = allBooks[indexPath.row].title
        cell.writerLabel.text = allBooks[indexPath.row].writer
        cell.introduceLabel.text = "민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은은은은은은은은은은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 어렵다민법은 ...."
        
      
        return cell
    }


}

extension IntroduceBooksView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if introduceIndex.contains(indexPath) {
            introduceIndex.removeAll(where: { $0 == indexPath })
        }
        else {
            introduceIndex.append(indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.introduce(content: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if introduceIndex.contains(indexPath) { return 300 }
        return 150
    }
}
