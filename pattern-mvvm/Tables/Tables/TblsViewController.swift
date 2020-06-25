//
//  ViewController.swift
//  Tables
//
//  Created by Adrian Florescu on 22/01/2019.
//  Copyright © 2019 infloresc.ro. All rights reserved.
//

import UIKit

class TblsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    var cellModels: [BadModel] = []

    var nrOfRows = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TblsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            nrOfRows -= 1
            let pathBelowMe = IndexPath(row: indexPath.row + 1, section: indexPath.section)
            tableView.deleteRows(at: [pathBelowMe], with: UITableView.RowAnimation.middle)
        }
    }
}

extension TblsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nrOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BadCell", for: indexPath) as? BadCell
        cell?.vc = self



        let model = BadModel()
        model.cell = cell
        model.vc = self
        cellModels.append(model)

        return cell ?? UITableViewCell()
    }
}

