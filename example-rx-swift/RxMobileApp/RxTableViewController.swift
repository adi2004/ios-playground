//
//  RxTableViewController.swift
//  RxMobileApp
//
//  Created by adrian.florescu on 20/01/2020.
//  Copyright © 2020 adrian.florescu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RxTableViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var tableView: UITableView!
    
    let data = BehaviorRelay<[String]>(value: ["First cell! (0)"])
    var disposeBag = DisposeBag()
    
    let names: [String] = ["Flax", "Apricots", "Oranges", "Papaya", "Mellon", "Grapes", "Cherry", "Bannana"]

    override func viewDidLoad() {
        super.viewDidLoad()

        data.asObservable()
          .bind(to: tableView
            .rx //2
            .items(cellIdentifier: "SimpleCell",
                   cellType: SimpleCell.self)) { //3
                    row, data, cell in
                    cell.label.text = data
          }
          .disposed(by: disposeBag) //5
        
        stepper.rx
            .value
            .debug("stepper", trimOutput: false)
            .skip(1)
            .subscribe(onNext: { val in
                self.tableView.beginUpdates()
                
                let value = Int(val)
                if value == self.data.value.count {
                    self.tableView.insertRows(at: [IndexPath(row: self.data.value.count, section: 0)], with: .automatic)
                    let name = "\(Int(self.stepper.value)). " +
                        self.names[Int(arc4random()) % self.names.count] +
                        " \(arc4random() % UInt32(self.names.count))"
                    self.data.accept(self.data.value + [name])
                } else {
                    let deleteIndex = Int(arc4random()) % self.data.value.count
                    var values = self.data.value
                    values.remove(at: deleteIndex)
                    self.data.accept(values)
                    self.tableView.deleteRows(at:[IndexPath(row: deleteIndex, section: 0)] , with: .automatic)
                }
                
                self.tableView.endUpdates()
            })
            .disposed(by: disposeBag)
    }
}
