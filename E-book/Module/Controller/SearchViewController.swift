//
//  SearchViewController.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/08.
//

import UIKit

class SearchViewController: UIViewController {

    var filteredBooks: [Book] = []
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        
        return isActive && isSearchBarHasText
    }

    
    @IBOutlet weak var searchTableView: UITableView! {
        didSet {
            self.searchTableView.dataSource = self
            self.searchTableView.delegate = self
            self.searchTableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "bookCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        self.navigationItem.title = "검색"
        self.navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "책 제목 또는 작가를 검색해주세요"
    }

}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.isFiltering ? self.filteredBooks.count : allBooks.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        
        if self.isFiltering {
 
            cell.bookImage.image = self.filteredBooks[indexPath.row].image
            cell.titleLabel.text = self.filteredBooks[indexPath.row].title
            cell.writerLabel.text = self.filteredBooks[indexPath.row].writer
        }
        else {
            cell.bookImage.image = allBooks[indexPath.row].image
            cell.titleLabel.text = allBooks[indexPath.row].title
            cell.writerLabel.text = allBooks[indexPath.row].writer
            
        }
        
        return cell
        
    }
    
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let contentvc = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        if !self.isFiltering {
            contentvc.bookTitle = allBooks[indexPath.row].title
        }
        else {
            contentvc.bookTitle = filteredBooks[indexPath.row].title
        }
        
        contentvc.modalPresentationStyle = .fullScreen
        self.present(contentvc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}


extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        self.filteredBooks = allBooks.filter { $0.title.contains(text) || $0.writer.contains(text) }
        
        self.searchTableView.reloadData()
    }
}
