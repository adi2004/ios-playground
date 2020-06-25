
import UIKit

class ViewController: UIViewController {
    @IBOutlet var stackView: UIStackView!
    var aView: CustomLabel?
    var bView: CustomLabel?
    var cView: CustomLabel?
    
    let txt = (left:   ">left TAP ME! one two three four five 6 7 more here<",
               center: ">center 1-1<",
               right:  ">right one two three four five 6 7<")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedBlue))
        
        aView = CustomLabel()
        //aView?.invalidateIntrinsicContentSize()
        aView?.text = txt.left
        aView?.numberOfLines = 0
        aView?.backgroundColor = .blue
        aView?.isUserInteractionEnabled = true
        aView?.addGestureRecognizer(tap)
        
        bView = CustomLabel()
        //bView?.invalidateIntrinsicContentSize()
        bView?.text = txt.center
        bView?.numberOfLines = 0
        bView?.backgroundColor = .yellow
        
        cView = CustomLabel()
        //cView?.invalidateIntrinsicContentSize()
        cView?.text = txt.right
        cView?.numberOfLines = 0
        cView?.backgroundColor = .red

//        let aContainerView = UIView()
//        aContainerView.addSubview(aView!)
//        let bContainerView = UIView()
//        bContainerView.addSubview(bView!)
//        let cContainerView = UIView()
//        cContainerView.addSubview(cView!)
        stackView.addArrangedSubview(aView!)
        stackView.addArrangedSubview(bView!)
        stackView.addArrangedSubview(cView!)
        stackView.axis = .horizontal
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        aView = CustomLabel()
        //        aView?.text = txt.left
        //        aView?.numberOfLines = 0
        //        aView?.invalidateIntrinsicContentSize()
        //        aView?.backgroundColor = .blue
        //
        //        bView = CustomLabel()
        //        bView?.text = txt.center
        //        bView?.numberOfLines = 0
        //        bView?.invalidateIntrinsicContentSize()
        //        bView?.backgroundColor = .yellow
        //
        //        cView = CustomLabel()
        //        cView?.text = txt.right
        //        cView?.numberOfLines = 0
        //        cView?.invalidateIntrinsicContentSize()
        //        cView?.backgroundColor = .red
        //
        //        stackView.addArrangedSubview(aView!)
        //        stackView.addArrangedSubview(bView!)
        //        stackView.addArrangedSubview(cView!)
        //        stackView.axis = .horizontal
        //        stackView.invalidateIntrinsicContentSize()
    }
    
    @objc func tappedBlue() {
        performSegue(withIdentifier: "tappedBlue", sender: self)
    }
}

