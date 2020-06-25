//
//  ViewController.swift
//  PageNew
//
//  Created by Adrian Florescu on 14.09.17.
//  Copyright © 2017 . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pageViewController: UIPageViewController!
    var ds = PhotoDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

//        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
//
//
//
//        addChildViewController(pageViewController)
//        self.view.addSubview(pageViewController.view)
//        pageViewController.didMove(toParentViewController: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare segue")
        guard let pvc = segue.destination as? UIPageViewController else { fatalError("Unexpected VC") }
        pageViewController = pvc
        pageViewController.view.backgroundColor = .darkGray

        let vcStory = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let photoVC = vcStory.instantiateViewController(withIdentifier: PageViewController.kID) as? PageViewController else { return }
        photoVC.dataSource = 0
        pageViewController.setViewControllers([photoVC], direction: .forward, animated: false, completion: {_ in })

        pageViewController.dataSource = ds
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIPageControl {
                view.backgroundColor = .black
            }
        }
    }
}

