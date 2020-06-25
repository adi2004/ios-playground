//
//  ViewController.swift
//  Stars
//
//  Created by Adrian Florescu on 20.04.16.
//  Copyright © 2016 infloresc.ro. All rights reserved.
//

import UIKit

extension k {
    struct path {
        let newK = "xyz"
    }
}

class CVMainViewController: UIViewController {
    private let spacing:CGFloat = 51.0
    private var minValue:CGPoint = CGPointMake(0.0, 0.0)
    private var maxValue:CGPoint = CGPointMake(0.0, 0.0)
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var simpleView: SimpleView!
    @IBOutlet var pinch: UIPinchGestureRecognizer!
    @IBOutlet var rotate: UIRotationGestureRecognizer!
    var current:Int = 0
    let size:(sections: Int, rows: Int) = (1, 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clearColor()
        customView.backgroundColor = UIColor.cyanColor()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.yellowColor()
        collectionView.layer.cornerRadius = 5
        collectionView.allowsSelection = true
        
        let grTap = UITapGestureRecognizer(target: self, action: #selector(dummyAction(_:)))
//        collectionView.addGestureRecognizer( UITapGestureRecognizer(target: self, action: nil) )
//        simpleView.addGestureRecognizer( UITapGestureRecognizer(target: self, action: nil) )
        self.view.addGestureRecognizer( grTap )
        simpleView.removeGestureRecognizer(grTap)
        collectionView.removeGestureRecognizer(grTap)
        self.view.addGestureRecognizer(pinch)
        self.view.addGestureRecognizer(rotate)

//        UIGestureRecognizer(target: self, action: scrollTo(i:))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let space = collectionView.frame.width / 2.0 - spacing / 2
        flow.sectionInset = UIEdgeInsetsMake(0.0, space, 0.0, space)
        scrollTo(0)
    }
    
    @IBAction func doPitch(sender: AnyObject) {
        print("pinch: \(sender)")
    }
    
    @IBAction func doRotate(sender: AnyObject) {
        print("rotate: \(sender)")
    }
    
    @IBAction func doGoToFirst(sender: AnyObject) {
        scrollTo(0)
    }
    
    @IBAction func doGoToLast(sender: AnyObject) {
        scrollTo(size.rows - 1)
    }
    
    @IBAction func doGoToPrevious(sender: AnyObject) {
        scrollTo(current - 1)
    }
    
    @IBAction func doGoToNext(sender: AnyObject) {
        scrollTo(current + 1)
    }
    
    func dummyAction(sender: UITapGestureRecognizer) {
        let point = sender.locationInView(simpleView)
        print("location \(point), pointInside? = \(simpleView.pointInside(point, withEvent: nil))")
        print("returned view: \(self.view.hitTest(sender.locationInView(self.view), withEvent: nil))")
        print("Dummy action in ViewController triggered by GestureRecognizer... \(sender)")
        // simple coll view touch
        let collectionViewPoint = sender.locationInView(simpleView.collectionView)
        if simpleView.collectionView.pointInside(collectionViewPoint, withEvent: nil) {
            print("tapped on a cell")
            let ip = simpleView.collectionView.indexPathForItemAtPoint(collectionViewPoint)
            print("ip \(ip)")
//            simpleView.collectionView.selectItemAtIndexPath(ip, animated: true, scrollPosition: UICollectionViewScrollPosition.Right)
            let cell = simpleView.collectionView.cellForItemAtIndexPath(ip!)
            cell?.backgroundColor = UIColor.redColor()
        }
        
        
        // collection view haneling
    }
    
    func collectionAction() {
        print("Action in ViewController triggered by GestureRecognizer on collectionView...")
    }
    
    func simpleViewAction() {
        print("Action in ViewController triggered by GestureRecognizer on simpleView...")
    }
    
    func scrollTo(i: Int) {
        let ii = (size.rows + i) % size.rows
        if 0 <= ii && ii < size.rows {
            desel(current)
            current = ii
            let ip:NSIndexPath = NSIndexPath(forRow: current, inSection: 0)
            self.collectionView.scrollToItemAtIndexPath(ip, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
            sel(current)
        }
    }
    
    func sel(i:Int) {
        let ip=NSIndexPath(forRow: i, inSection: 0)
        collectionView.selectItemAtIndexPath(ip, animated: true, scrollPosition: UICollectionViewScrollPosition.CenteredHorizontally)
        let cell = collectionView.cellForItemAtIndexPath(ip)
        if let cellU = cell {
            cellU.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
    }
    
    func desel(i:Int) {
        let ip=NSIndexPath(forRow: i, inSection: 0)
        let cell = collectionView.cellForItemAtIndexPath(ip)
        if let cellU = cell {
            cellU.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)
        }
    }
}

extension CVMainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return size.sections
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return size.rows
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)
        let lbl = cell.viewWithTag(200) as! UILabel
        lbl.text = "\(indexPath.row)"
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        sel(indexPath.row)
        scrollTo(indexPath.row)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        desel(indexPath.row)
    }
}

extension CVMainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //print("scrollViewDidScroll \(scrollView.contentOffset)")
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        print("scrollViewDidEndScrollingAnimation \(scrollView.contentOffset)")
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging \(scrollView.contentOffset) decelerate: \(decelerate)")
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating \(scrollView.contentOffset)")
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let ip = self.collectionView.indexPathForItemAtPoint(CGPointMake(targetContentOffset.memory.x + 10.0, targetContentOffset.memory.y + 10.0))
        print(ip)
        if let ipU = ip {
            scrollTo(ipU.row)
        }
//        print("scrollViewWillEndDragging \(targetContentOffset.memory.x)")
//        var x:CGFloat = targetContentOffset.memory.x
//        x = CGFloat(roundf(Float(x) / 50.0) * 50.0)
//        print("x=\(x)")
//        targetContentOffset.memory = CGPointMake(x, targetContentOffset.memory.y)
    }
}
