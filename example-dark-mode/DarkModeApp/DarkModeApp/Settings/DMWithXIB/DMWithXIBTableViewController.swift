import UIKit

class DMWithXIBTableViewController: UITableViewController {
    private let model: [(name: String, style: UIUserInterfaceStyle)] = [
        (name: "Unspecified", style: .unspecified),
        (name: "Dark", style: .dark),
        (name: "Light", style: .light)
    ]
}

// MARK: - UITableViewDataSource
extension DMWithXIBTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.selectionStyle = .none
        cell.accessoryType = UIApplication.shared.windows.first?.overrideUserInterfaceStyle == model[indexPath.row].style ? .checkmark : .none
        cell.textLabel?.text = model[indexPath.row].name
        cell.applyStyles()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (0 ..< model.count)
            .map { i in IndexPath(row: i, section: 0) }
            .forEach { iP in
                let cell = tableView.cellForRow(at: iP)
                cell?.accessoryType = iP == indexPath ? .checkmark : .none
            }
        UIApplication.shared.windows.forEach { window in
            UserDefaults.standard.darkModePreference = self.model[indexPath.row].style.rawValue
            UIView.transition(
                with: window,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: {
                    window.overrideUserInterfaceStyle = self.model[indexPath.row].style
                },
                completion: nil
            )
        }
    }
}
