
import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var left: CustomLabel!
    @IBOutlet weak var right: CustomLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //        a = CustomLabel()
        //        a.backgroundColor = .red
        //        stackView.addSubview(a)
        //
        //        b = CustomLabel()
        //        b.backgroundColor = .green
        //        stackView.addSubview(b)
        //
        //        c = CustomLabel()
        //        c.backgroundColor = .blue
        //        stackView.addSubview(c)
        
        //        stackView.alignment
        //        stackView.distribution = .fillProportionally
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override var intrinsicContentSize: CGSize {
        get {
            //            if dim == 0 {
            //                print("for \(self) dim = 0")
            //            }
            let left = self.left.text?.count ?? 0
            let right = self.right.text?.count ?? 0
            return CGSize(width: left + right, height: left + right)
        }
    }
}
