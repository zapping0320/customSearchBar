//
//  ViewController.swift
//  SearchBar
//
//  Created by 김동현 on 05/07/2019.
//  Copyright © 2019 John Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchVC = UISearchController(searchResultsController: nil)
        
        self.navigationItem.searchController = searchVC
    }


}

