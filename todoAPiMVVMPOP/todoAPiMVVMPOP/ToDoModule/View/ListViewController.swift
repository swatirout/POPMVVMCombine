//
//  ListViewController.swift
//  todoAPiMVVMPOP
//
//  Created by Swati Rout on 18/05/23.
//

import Foundation
import UIKit
class ListViewController: UIViewController, ListViewProtocol {
    
    @IBOutlet weak var listTv: UITableView!
    
    var viewModel: ListViewModelProtocol?
    
    // Add necessary UI elements and IBOutlet properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ListCell", bundle: .main)
        listTv.register(nib, forCellReuseIdentifier: "ListCell")
        // Initialize view model
        viewModel = ItemListViewModel()
        viewModel?.view = self
        viewModel?.fetchItem()
        listTv.rowHeight = UITableView.automaticDimension
        listTv.estimatedRowHeight = 100 // Set an approximate value

    }
    
    func reloadData() {
        listTv.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Fetch post data when the view appears
    }
    
    // Implement UI and user interaction methods
    
    func showLoading() {
        // Show loading indicator
    }
    
    func hideLoading() {
        // Hide loading indicator
    }
    
    func showErrorMessage(with title: String) {
        
    }
    
  
    
    func displayItem(item: Item) {
        // Update UI elements with the fetched post data
    }
}

extension ListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItem ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell =   tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell
        let value = viewModel?.getItem(at: indexPath.row)
        cell?.titleLabel.text = value?.title
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}




