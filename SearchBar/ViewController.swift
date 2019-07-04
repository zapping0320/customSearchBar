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
        
        let searchVC = UISearchController(searchResultsController: nil)
        
        self.navigationItem.searchController = searchVC
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch isFiltered {
        case true:
            return filterWordList.count
        case false:
            return wordList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isFiltered {
            return filteredWordListCell
        }else {
            return workListCell
        }
        
    }
}
