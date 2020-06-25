
import UIKit

class CustomCLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: 3 * 100, height: 3)
        }
    }
}
