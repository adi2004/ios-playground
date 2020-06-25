//
//  ViewController.swift
//  ReactiveDemo
//
//  Created by adrian.florescu on 13/04/2020.
//  Copyright © 2020 infloresc. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class ViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    let viewDidLoadProperty = MutableProperty<Void>(())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewDidLoadProperty.value = ()
        
        passwordTextField.reactive.continuousTextValues
    }


}

