//
//  CustomView.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/08.
//

import UIKit

protocol AllBooksViewDelegate: AnyObject {
    func moveVCFromAllBooksView(to content: Int)
}

class CustomView: UIView {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "bookCell")
        }
    }
    static let shared = CustomView()
    weak var delegate: AllBooksViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadView()
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
        fatalError("init(coder:) has not been implemented")
    }

    func loadView() {
        let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)!.first as! UIView
        view.frame = self.bounds
        addSubview(view)
    }
}

extension CustomView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allBooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell

        cell.bookImage.image = allBooks[indexPath.row].image
        cell.titleLabel.text = allBooks[indexPath.row].title
        cell.writerLabel.text = allBooks[indexPath.row].writer
        return cell
    }


}

extension CustomView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.moveVCFromAllBooksView(to: indexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
