
import UIKit

class CustomALabel: UILabel {
    override var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: 1 * 100, height: 30)
        }
    }
}
