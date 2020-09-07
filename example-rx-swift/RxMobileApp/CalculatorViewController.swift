//
//  CalculatorViewController.swift
//  RxMobileApp
//
//  Created by adrian.florescu on 04/09/2020.
//  Copyright © 2020 adrian.florescu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CalculatorViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedTextField: UITextField!

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distanceTextField: UITextField!

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        speedTextField
            .rx
            .controlEvent(.editingDidBegin)
            .subscribe(onNext: {
                self.speedLabel.text = "Speed *"
            })
            .disposed(by: disposeBag)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
