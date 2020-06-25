
import UIKit

class TableViewController: UITableViewController {
    let data = [
        (left: ">left one two three four five<", right: "7"),
        (left: ">left one two three four five 6 7 more here<", right: ">right one two three four five 6 7<"),
        (left: ">left one two three four five 6 7<", right: ">right one two three four five 6 7 something<"),
        (left: "6 = ", right: ">right one two three four five 6 7 eight<"),
        (left: ">left one two three four five 6 7 right one two three four five 6 7 eight right one two three four five 6 7 eight<", right: " "),
        (left: " ", right: ">right one two three four five 6 7 right one two three four five 6 7 eight right one two three four five 6 7 eight<"),
        (left: "left label only, the other one is empty string", right: " "),
        (left: " ", right: "right label only, the other one is empty string")
    ]
    
    var cellNibName = "TableCell_StackView"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.rowHeight = UITableView.automaticDimension
        let tableCellNib = UINib(nibName: cellNibName, bundle: nil)
        tableView.register(tableCellNib, forCellReuseIdentifier: "TableCellXib")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 50
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellXib") as? TableCell {
            cell.ip = indexPath
            
            let leftText = data[indexPath.row].left.isEmpty ? " " : data[indexPath.row].left
            cell.leftLabel.text = leftText
            let rightText = data[indexPath.row].right.isEmpty ? " " : data[indexPath.row].right
            cell.rightLabel.text = rightText

            // this line here is crutial in makeing sure the views are display correctly after dequeue
            cell.leftLabel.superview?.invalidateIntrinsicContentSize()
            cell.rightLabel.superview?.invalidateIntrinsicContentSize()
            cell.layoutIfNeeded()
            return cell
        }
        return UITableViewCell()
    }

//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        print("willDisplay ip: \(indexPath)")
//        print("willDisplay cell.frame: \(cell.frame)")
//        if let xibCell = cell as? TableCell {
//            print("willDisplay xibCell.leftLabel.frame: \(xibCell.leftLabel.frame)")
//            print("willDisplay xibCell.rightLabel.frame: \(xibCell.rightLabel.frame)")
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        print("didEndDisplaying ip: \(indexPath)")
//        print("didEndDisplaying cell.frame: \(cell.frame)")
//        if let xibCell = cell as? TableCell {
//            print("didEndDisplaying xibCell.leftLabel.frame: \(xibCell.leftLabel.frame)")
//            print("didEndDisplaying xibCell.rightLabel.frame: \(xibCell.rightLabel.frame)")
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "titleForHeaderInSection section: \(section)"
//    }
//
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "titleForFooterInSection section: \(section)"
//    }
}

