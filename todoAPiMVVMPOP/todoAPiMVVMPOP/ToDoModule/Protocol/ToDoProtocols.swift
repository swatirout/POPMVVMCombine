//
//  ToDoProtocols.swift
//  todoAPiMVVMPOP
//
//  Created by Swati Rout on 18/05/23.
//

import Foundation
protocol ListViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showErrorMessage(with title: String)
    //func displayItem(item: Item)
    func reloadData()

}

protocol ListViewModelProtocol {
    var view:ListViewProtocol? {get set}
    func fetchItem()
    var numberOfItem: Int { get }
    func getItem(at index: Int) -> Item


}
