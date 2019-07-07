//
//  ViewController.swift
//  SearchBar
//
//  Created by 김동현 on 05/07/2019.
//  Copyright © 2019 John Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
   
    var wordList = ["all", "blue", "sky", "hello",
                    "number", "marvel", "spiderman",
                    "친구", "사랑", "재범", "몸매"]
    
    var filterWordList:[String] = []
    var isFiltered = false
    

    @IBOutlet weak var searchTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchC = UISearchController(searchResultsController: nil)
        searchC.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchC
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        searchTableView.register(UINib(nibName: "WordCell", bundle: nil), forCellReuseIdentifier: "wordCell")
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch isFiltered {
        case true:
            return filterWordList.count
        case false:
            return wordList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = searchTableView.dequeueReusableCell(withIdentifier: "wordCell") as! WordCell
        
        switch isFiltered {
        case true:
            cell.wordLabel.text = self.filterWordList[indexPath.row]
        case false:
           cell.wordLabel.text = self.wordList[indexPath.row]
        }
        
        return cell
        
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let hasText = searchController.searchBar.text {
            if hasText.isEmpty {
                self.isFiltered = false
            }else {
                self.isFiltered = true
//                self.filterWordList = self.wordList.filter({ (element) -> Bool in
//                    return element.contains(hasText)
//                })
                self.filterWordList = self.wordList.filter({ $0.contains(hasText) })
            }
            self.searchTableView.reloadData()
        }
    }
}
