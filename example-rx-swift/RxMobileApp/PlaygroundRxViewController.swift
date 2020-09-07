//
//  PlaygroundRxViewController.swift
//  RxMobileApp
//
//  Created by adrian.florescu on 04/09/2020.
//  Copyright © 2020 adrian.florescu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import os.log


class PlaygroundRxViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var somethingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        somethingButton
            .rx
            .controlEvent(.touchUpInside)
            .subscribe(onNext: {
                print("hello!")
            })
            .disposed(by: disposeBag)
        
        somethingButton
            .rx
            .controlEvent(.touchUpInside)
            .asSingle()
            .subscribe(onSuccess: { _ in
                os_log("viewDidLoad > subscribed....")
            }, onError: nil)
            .disposed(by: disposeBag)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doSomething(_ sender: Any) {
        os_log("inside doSomething")
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
