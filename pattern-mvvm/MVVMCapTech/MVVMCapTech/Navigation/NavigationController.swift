import UIKit

class NavigationController: UINavigationController {
    var currentViewControllerIndex = 0
    let viewControllerModel = [
        CTModel(title: "Home View Controller", barButtonText: "Next", background: .white, cells: [
            CellModel(title: "Easily change", color: .lightRed),
            CellModel(title: "the text & color in"),
            CellModel(title: "each cell in the", color: .lightBlue),
            CellModel(title: "view manager!", color: .lightGreen),
            CellModel(title: "Tap me and I'll grow!", type: .expandable),
            CellModel(title: "You can't see me", color: .black),
            CellModel(title: "Acordeon", color: .lightRed, type: .disclosure),
            CellModel(title: "I can grow too!", color: .blue, type: .expandable)
            ]),
        CTModel(title: "Orange View Controller", barButtonText: "Next", background: .orange, cells:  [
            CellModel(title: "And yet another row...A BIG row!", rowHeight: 100),
            ]),
        CTModel(title: "Yellow View Controller", barButtonText: "Next", background: .yellow, cells: []),
        CTModel(title: "Green View Controller", barButtonText: "Done", background: .green, cells: [
            CellModel(title: "Amazingly easy", color: .lightWhite),
            CellModel(title: "Crazy Simple", color: .lightWhite),
            CellModel(title: "Thin View Controller Classes", color: .lightWhite),
            CellModel(title: "Less Defects", color: .lightWhite),
            ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        if let vc = viewControllers.first as? CTViewController {
            vc.viewModel = CTViewModel(with: viewControllerModel[currentViewControllerIndex])
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prep!")
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        print("pop")
        currentViewControllerIndex -= 1
        return super.popViewController(animated: true)
    }

    @objc func handleBarButton() {
        print("ping!")
        guard currentViewControllerIndex < viewControllerModel.count - 1 else {
            currentViewControllerIndex = 0
            popToRootViewController(animated: true)
            return
        }
        let story = UIStoryboard(name: "Main", bundle: .main)
        let vc = story.instantiateViewController(withIdentifier: "CTViewController")
        if let customVC = vc as? CTViewController {
            currentViewControllerIndex += 1
            customVC.viewModel = CTViewModel(with: viewControllerModel[currentViewControllerIndex])
            pushViewController(vc, animated: true)
        }

    }
}
