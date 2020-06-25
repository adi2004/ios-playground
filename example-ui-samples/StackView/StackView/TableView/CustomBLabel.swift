
import UIKit

class CustomBLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: 2 * 100, height: 30)
        }
    }
}
