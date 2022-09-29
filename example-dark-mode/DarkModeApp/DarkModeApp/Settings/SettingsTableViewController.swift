//
//  SettingsTableViewController.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 22.09.2022.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    let viewModel = SettingsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Table view data source
extension SettingsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cell(at: indexPath)
    }
}

extension SettingsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = viewModel.viewController(at: indexPath) else {
            return
        }
        show(vc, sender: self)
    }
}
