//
//  DMWithVMTableViewController.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 29.09.2022.
//

import UIKit

class DMWithVMTableViewController: UITableViewController {
    private let viewModel: DMWithVMViewModel

    init(viewModel: DMWithVMViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyles()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.selectionStyle = .none
        cell.accessoryType = UIApplication.shared.windows.first?.overrideUserInterfaceStyle == viewModel.model[indexPath.row].style ? .checkmark : .none
        cell.textLabel?.text = viewModel.model[indexPath.row].name
        cell.applyStyles()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (0 ..< viewModel.model.count)
            .map { i in IndexPath(row: i, section: 0) }
            .map { indexPath in tableView.cellForRow(at: indexPath)}
            .forEach { cell in cell?.accessoryType = .none }
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        UIApplication.shared.windows.forEach { window in
            UIView.transition(
                with: window,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: {
                    window.overrideUserInterfaceStyle = self.viewModel.model[indexPath.row].style
                },
                completion: nil
            )
        }
    }
}
