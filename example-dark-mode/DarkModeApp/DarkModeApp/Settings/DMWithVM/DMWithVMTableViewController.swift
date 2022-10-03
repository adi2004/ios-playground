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

    private static func updateUserInterfaceStyle(with style: UIUserInterfaceStyle) {
        UIApplication.shared.windows.forEach { window in
            UIView.transition(
                with: window,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: {
                    window.overrideUserInterfaceStyle = style
                },
                completion: nil)
        }
    }
}

// MARK: - UITableViewDataSource
extension DMWithVMTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.selectionStyle = .none
        cell.accessoryType = viewModel.model[indexPath.row].isSelected ? .checkmark : .none
        cell.textLabel?.text = viewModel.model[indexPath.row].name
        cell.applyStyles()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedIndex = viewModel.selectedIndex {
            let selectedIndexPath = IndexPath(row: selectedIndex, section: 0)
            tableView.cellForRow(at: selectedIndexPath)?.accessoryType = .none
        }

        viewModel.select(at: indexPath.row) {
            Self.updateUserInterfaceStyle(with: viewModel.model[indexPath.row].style)
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
}
