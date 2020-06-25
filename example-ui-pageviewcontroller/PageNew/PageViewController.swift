//
//  PageViewController.swift
//  PageNew
//
//  Created by Adrian Florescu on 14.09.17.
//  Copyright © 2017 . All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    static let kID = "PageViewController"
    var dataSource = 0
    @IBOutlet weak var lbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        lbl.text = "\(dataSource)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
