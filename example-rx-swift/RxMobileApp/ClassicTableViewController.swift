//
//  ClassicTableViewController.swift
//  RxMobileApp
//
//  Created by adrian.florescu on 20/01/2020.
//  Copyright © 2020 adrian.florescu. All rights reserved.
//

import UIKit

class ClassicTableViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var tableView: UITableView!
    
    var data: [String] = ["This is the inital cell"]
    
    let names: [String] = ["Flax", "Apricots", "Oranges", "Papaya", "Mellon", "Grapes", "Cherry", "Bannana"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func valueChanged(_ sender: UIStepper) {
        tableView.beginUpdates()
        let value = Int(sender.value)
        if value == data.count {
            tableView.insertRows(at: [IndexPath(row: data.count, section: 0)], with: .automatic)
            let name = "\(Int(sender.value)). " + names[Int(arc4random()) % names.count] + " \(arc4random() % UInt32(names.count))"
            data.append(name)
        } else {
            let row = Int(arc4random()) % data.count
            data.remove(at: row)
            tableView.deleteRows(at:[IndexPath(row: row, section: 0)] , with: .automatic)
        }
        tableView.endUpdates()
    }
}

extension ClassicTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleCell", for: indexPath) as! SimpleCell
        cell.label.text = data[indexPath.row]
        return cell
    }
}

extension ClassicTableViewController: UITableViewDelegate {
    
}
