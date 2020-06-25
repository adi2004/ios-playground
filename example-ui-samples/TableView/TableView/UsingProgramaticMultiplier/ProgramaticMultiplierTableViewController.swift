
import UIKit

class ProgramaticMultiplierTableViewController: UITableViewController {
    let data = [
        (left: ">left one two three four five<", right: "7"),
        (left: ">left one two three four five 6 7 more here<", right: ">right one two three four five 6 7<"),
        (left: ">left one two three four five 6 7<", right: ">right one two three four five 6 7 something<"),
        (left: "6 = ", right: ">right one two three four five 6 7 eight<"),
        (left: ">left one two three four five 6 7 right one two three four five 6 7 eight right one two three four five 6 7 eight<", right: " "),
        (left: " ", right: ">right one two three four five 6 7 right one two three four five 6 7 eight right one two three four five 6 7 eight<"),
        (left: "left label only, the other one is empty string", right: ""),
        (left: "", right: "right label only, the other one is empty string")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MultiplierTableViewCell", for: indexPath) as? MultiplierTableViewCell {
            var left = data[indexPath.row].left
            if left == "" {
                left = " "
            }
            cell.leftLabel.text = left
            var right = data[indexPath.row].right
            if right == "" {
                right = " "
            }
            cell.rightLabel.text = right
            let multiplier = CGFloat(left.count) / CGFloat(right.count)
            cell.leftRightRationConstraint?.isActive = false
            cell.leftRightRationConstraint = NSLayoutConstraint(
                item: cell.leftLabel,
                attribute: .width,
                relatedBy: .equal,
                toItem: cell.rightLabel,
                attribute: .width,
                multiplier: multiplier,
                constant: 0)
            cell.leftRightRationConstraint?.isActive = true

            return cell
        }
        return UITableViewCell()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
