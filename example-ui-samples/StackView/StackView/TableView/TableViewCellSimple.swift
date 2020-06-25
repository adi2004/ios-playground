
import UIKit

class TableViewCellSimple: UITableViewCell {
    @IBOutlet weak var left: UILabel!
    @IBOutlet weak var right: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
