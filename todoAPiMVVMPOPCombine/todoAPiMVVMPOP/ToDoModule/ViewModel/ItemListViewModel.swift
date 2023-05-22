//
//  ItemListViewModel.swift
//  todoAPiMVVMPOP
//
//  Created by Swati Rout on 18/05/23.
//

import Foundation
import Combine
class ItemListViewModel: ListViewModelProtocol {
    var listPublisher: AnyPublisher<[Item], Never> {
        return Just(items).eraseToAnyPublisher()
    }
    
    private var items: [Item] = []
    
    var numberOfItem: Int {
        return items.count
    }
    
    weak var view: ListViewProtocol?
    func fetchItem() {
        
        let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/"
         guard let url = URL(string: todoEndpoint) else {
           print("Error: cannot create URL")
           return
         }
         let urlRequest = URLRequest(url: url)

         // set up the session
         let config = URLSessionConfiguration.default
         let session = URLSession(configuration: config)

         // make the request
         let task = session.dataTask(with: urlRequest) {(data, response, error) in
           // check for any errors
           guard error == nil else {
             print("error calling GET on /todos/1")
             print(error!)
             return
           }
           // make sure we got data
           guard let responseData = data else {
             print("Error: did not receive data")
             return
           }
           // parse the result as JSON, since that's what the API provides
           do {
            let decoder = JSONDecoder()
               let items = try decoder.decode([Item].self, from: responseData)
                   print("The items are: \(items)")

                   for item in items {
                       print("Item ID: \(item.id), Title: \(item.title)")
                   }
               self.items = items
            
               DispatchQueue.main.async {
                   self.view?.reloadData()
               }
           } catch  {
             print("error trying to convert data to JSON")
             return
           }
         }
         task.resume()
            }
    
    func getItem(at index: Int) -> Item {
        return items[index]
    }

}
