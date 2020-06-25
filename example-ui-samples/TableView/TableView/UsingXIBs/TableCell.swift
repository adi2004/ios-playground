
import UIKit

class TableCell: UITableViewCell {
    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var rightLabel: UILabel!

    var ip: IndexPath?

//    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
//        self.backgroundColor = highlighted ? .darkGray : .lightGray
//        leftLabel.sizeToFit()
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        self.backgroundColor = selected ? .red : .yellow
//    }
//
//    override func updateConstraints() {
//        print("updateConstraints ip: \(ip?.section ?? -1), \(ip?.row ?? -1)")
//        super.updateConstraints()
//    }
//
//    override func setNeedsUpdateConstraints() {
//        print("setNeedsUpdateConstraints ip: \(ip?.section ?? -1), \(ip?.row ?? -1)")
//        super.setNeedsUpdateConstraints()
//    }
//
//    override func updateConstraintsIfNeeded() {
//        print("updateConstraintsIfNeeded ip: \(ip?.section ?? -1), \(ip?.row ?? -1)")
//        super.updateConstraintsIfNeeded()
//    }
//
//    override func layoutSubviews() {
//        print("layoutSubviews ip: \(ip?.section ?? -1), \(ip?.row ?? -1)")
//        super.layoutSubviews()
//    }
//
//    override func setNeedsLayout() {
//        print("setNeedsLayout ip: \(ip?.section ?? -1), \(ip?.row ?? -1)")
//        super.setNeedsLayout()
//    }
//
//    override func layoutIfNeeded() {
//        print("layoutIfNeeded ip: \(ip?.section ?? -1), \(ip?.row ?? -1)")
//        super.layoutIfNeeded()
//    }
//
//    override func draw(_ rect: CGRect) {
//        print("draw ip: \(ip?.section ?? -1), \(ip?.row ?? -1)")
//        super.draw(rect)
//    }
//
//    override func setNeedsDisplay() {
//        print("setNeedsDisplay ip: \(ip?.section ?? -1), \(ip?.row ?? -1)")
//        super.setNeedsDisplay()
//    }
//
//    override func setNeedsFocusUpdate() {
//        print("setNeedsFocusUpdate ip: \(ip?.section ?? -1), \(ip?.row ?? -1)")
//        super.setNeedsFocusUpdate()
//    }
//
//    override func updateFocusIfNeeded() {
//        print("updateFocusIfNeeded ip: \(ip?.section ?? -1), \(ip?.row ?? -1)")
//        super.updateFocusIfNeeded()
//    }

}
