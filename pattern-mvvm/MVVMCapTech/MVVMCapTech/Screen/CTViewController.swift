import UIKit

class CTViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var imageView: UIImageView!

    var viewModel: CTViewModel!
    var color: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        let nextButton = UIBarButtonItem(title: viewModel.model.barButtonText, style: .plain, target: self, action: #selector(handleBarButton))
        navigationItem.rightBarButtonItem = nextButton
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.register(InfoCell.self, forCellReuseIdentifier: "InfoCell")
        tableView.register(ExpandingCell.self, forCellReuseIdentifier: "ExpandingCell")
        tableView.register(InfoCell.self, forCellReuseIdentifier: "DisclosureCell")
        viewModel.setup(self)
        viewModel.vc = self
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt: \(indexPath)")
        return viewModel.dequeue(tableView, cellAt: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.didSelect(tableView, didSelectRowAt: indexPath, on: self)
        DispatchQueue.global().async {
            tableView.reloadData()
        }
        DispatchQueue.global().async {
            tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
        DispatchQueue.main.async {
             tableView.reloadData()
        }
        DispatchQueue.main.async {
            tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }

    @objc func handleBarButton() {
        if let nav = navigationController as? NavigationController {
            nav.handleBarButton()
        }
    }
}
