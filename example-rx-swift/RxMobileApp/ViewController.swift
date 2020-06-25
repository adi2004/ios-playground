//
//  ViewController.swift
//  RxMobileApp
//
//  Created by adrian.florescu on 05/11/2019.
//  Copyright © 2019 adrian.florescu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var buttonTop: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var progress = Progress(totalUnitCount: 19)
    var timer: Timer?
    
    @IBOutlet weak var buttonMiddle: UIButton!
    @IBOutlet weak var middleProgressBar: UIProgressView!
    var middleProgress = Progress(totalUnitCount: 19)
    var middleTimer: Timer?
    var startTime = Date()
    
    @IBOutlet weak var buttonBottom: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.isHidden = true
        progressBar.observedProgress = progress
        
        middleProgressBar.isHidden = true
        middleProgressBar.observedProgress = middleProgress
        
        buttonTop.rx.tap
            .debug("buttonTop", trimOutput: true)
            .map {
                print("in map")
                self.progressBar.isHidden = false
                self.progress.completedUnitCount = 0
                self.timer?.invalidate()
                
                self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    self.progress.completedUnitCount += 1
                }
            }
            .debounce(RxTimeInterval.seconds(2), scheduler: MainScheduler.instance)
            .subscribe(onNext: { _ in
                print("subscribe onNext")
                self.timer?.invalidate()
                var color = self.buttonTop.backgroundColor
                color = color != .red ? .red : .yellow
                self.buttonTop.backgroundColor = color
            }, onCompleted: {
                print("onCompleted")
            })
            .disposed(by: disposeBag)
        
        buttonMiddle.rx.tap
            .debug("buttonMiddle", trimOutput: true)
            .map {}
            .throttle(RxTimeInterval.milliseconds(2000), scheduler: MainScheduler.instance)
            .subscribe(onNext: { _ in
                print("subscribe onNext \(Date())")
                var color = self.buttonMiddle.backgroundColor
                color = color != .red ? .red : .yellow
                self.buttonMiddle.backgroundColor = color
                
                self.middleProgressBar.isHidden = false
                self.middleProgress.completedUnitCount = 0
                self.middleTimer?.invalidate()
                print("Time elapsed: \(Date().timeIntervalSince1970 - self.startTime.timeIntervalSince1970)")
                self.startTime = Date()
                
                self.middleTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    print("self.middleProgress.completedUnitCount = \(self.middleProgress.completedUnitCount)")
                    self.middleProgress.completedUnitCount += 1
                    if self.middleProgress.completedUnitCount > self.middleProgress.totalUnitCount {
                        self.middleTimer?.invalidate()
                    }
                }
                
            })
            .disposed(by: disposeBag)
        
        buttonBottom.rx.tap
            .debug("buttonBottom", trimOutput: true)
            .subscribe(onNext: { _ in
                print("subscribe onNext")
                var color = self.buttonBottom.backgroundColor
                color = color != .red ? .red : .yellow
                self.buttonBottom.backgroundColor = color
            })
            .disposed(by: disposeBag)
    }

    @IBAction func doActionButtonTop(_ sender: Any) {
        print("inside doActionButtonTop")
    }
}

