
import UIKit

class CustomLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: text?.count ?? 0, height: text?.count ?? 0)
        }
    }
}
