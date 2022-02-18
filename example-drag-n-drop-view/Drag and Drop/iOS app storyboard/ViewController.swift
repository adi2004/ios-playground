
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func panView(_ sender: UIPanGestureRecognizer) {
//        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        Vibration.success.vibrate()
        let translation = sender.translation(in: self.view)
     
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x,
                y: viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
        }
    }
}

