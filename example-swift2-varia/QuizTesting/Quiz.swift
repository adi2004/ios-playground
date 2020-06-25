//
//  Quiz.swift
//  Swift
//
//  Created by Adrian Florescu on 01.06.16.
//  Copyright © 2016 infloresc.ro. All rights reserved.
//

import UIKit

class Quiz : UIViewController {
    @IBOutlet weak var firstValue: UILabel!
    @IBOutlet weak var secondValue: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var result: UITextField!
    
    override func viewDidAppear(animated: Bool) {
        result.becomeFirstResponder()
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        result.resignFirstResponder()
    }
}

extension Quiz : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.text = "ok"
    }
}