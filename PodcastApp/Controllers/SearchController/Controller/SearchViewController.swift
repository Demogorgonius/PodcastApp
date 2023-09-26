//
//  SearchViewController.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

class SearchViewController: CustomViewController<SearchView> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
}
