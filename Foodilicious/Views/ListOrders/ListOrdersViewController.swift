//
//  ListOrdersViewController.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 27.01.2023.
//

import UIKit

class ListOrdersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id1", name: "Ali Görkem Aksöz", dish: .init(id: "id1", name: "Kuşkaş", description: "Domatesi az ise 2 porsiyon bile yerim", image: "https://picsum.photos/100/200", calories: 102)),
        .init(id: "id1", name: "Erdem Aksöz", dish: .init(id: "id1", name: "Steak", description: "Hayatımda hiç yemedim ama genede en sevdiğim yemek.", image: "https://picsum.photos/100/200", calories: 102)),
        .init(id: "id1", name: "Mehmet Kayra Aksöz", dish: .init(id: "id1", name: "Sulu köfte", description: "Her gün 3 öğün yerim.", image: "https://picsum.photos/100/200", calories: 102)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName:  DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
