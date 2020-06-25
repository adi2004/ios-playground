//
//  SimpleView.swift
//  Swift
//
//  Created by Adrian Florescu on 06.05.16.
//  Copyright © 2016 infloresc.ro. All rights reserved.
//

import UIKit

class SimpleView: UIView {
    //MARK:init methods
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        if self.subviews.count == 0 {
//            self.nibSetup()
//        }
//    }
    @IBOutlet weak var width: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    private let identifier = "Cell"
    
    
    override internal func removeFromSuperview() {
        print("removeFromSuperview")
        super.removeFromSuperview()
    }
    override internal func insertSubview(view: UIView, atIndex index: Int){ print("insertSubview")
        super.insertSubview(view, atIndex: index)
    }
    override internal func exchangeSubviewAtIndex(index1: Int, withSubviewAtIndex index2: Int){
        print("exchangeSubviewAtIndex")
        super.exchangeSubviewAtIndex(index1, withSubviewAtIndex: index2)
    }
    override internal func addSubview(view: UIView){
        print("addSubview")
        super.addSubview(view)
    }
    override internal func insertSubview(view: UIView, belowSubview siblingSubview: UIView){
        print("insertSubview belowSubview")
    }
    override internal func insertSubview(view: UIView, aboveSubview siblingSubview: UIView){
        print("insertSubview aboveSubview")
    }
    override internal func bringSubviewToFront(view: UIView){
        print("bringSubviewToFront")
    }
    override internal func sendSubviewToBack(view: UIView){
        print("sendSubviewToBack")
    }
    override internal func didAddSubview(subview: UIView){
        print("didAddSubview")
    }
    override internal func willRemoveSubview(subview: UIView){
        print("willRemoveSubview")
    }
    override internal func willMoveToSuperview(newSuperview: UIView?){
        print("willMoveToSuperview")
    }
    override internal func didMoveToSuperview(){
        print("didMoveToSuperview")
    }
    override internal func willMoveToWindow(newWindow: UIWindow?){
        print("willMoveToWindow")
    }
    override internal func didMoveToWindow(){
        print("didMoveToWindow")
    }
    override internal func isDescendantOfView(view: UIView) -> Bool {
        //        print("isDescendantOfView")
        return super.isDescendantOfView(view)
    }
    override internal func viewWithTag(tag: Int) -> UIView? {
        print("viewWithTag")
        return super.viewWithTag(tag)
    }
    override internal func setNeedsLayout(){
        print("setNeedsLayout")
        super.setNeedsLayout()
    }
    override internal func layoutIfNeeded(){
        print("layoutIfNeeded")
    }
    override internal func layoutSubviews(){
//        print("layoutSubviews, \(collectionView.frame)")
        super.layoutSubviews()
//        print("- layoutSubviews, \(collectionView.frame)")
        print("width = \(width)")
//        self.hitTest(<#T##point: CGPoint##CGPoint#>, withEvent: <#T##UIEvent?#>)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("***** In init coder: \(self.subviews), ---- \(self.subviews.count)")
        if self.subviews.count == 0 {
            self.nibSetup()
        }
    }
    
    private func nibSetup() {
        let viewToAdd:UIView = loadViewFromNib()
        addSubview(viewToAdd)
        //viewToAdd.backgroundColor = UIColor.clearColor()
        self.addConstraintsToMatchSize(viewToAdd)
        self.layoutIfNeeded()
        self.collectionView.registerNib(UINib(nibName:"Cell", bundle: nil), forCellWithReuseIdentifier: identifier)
        collectionView.allowsSelection = true
    }
    
    private func loadViewFromNib() -> UIView {
        let nibView = NSBundle.mainBundle().loadNibNamed("SimpleView", owner: self, options: nil)[0] as! UIView
        return nibView
    }
    
    private func addConstraintsToMatchSize (viewToResize:UIView) {
        if let sview = viewToResize.superview {
            if sview == self {
                self.translatesAutoresizingMaskIntoConstraints = false
                viewToResize.translatesAutoresizingMaskIntoConstraints = false
                let cstTop:NSLayoutConstraint = NSLayoutConstraint(
                    item: sview,
                    attribute: NSLayoutAttribute.Top,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: viewToResize,
                    attribute: NSLayoutAttribute.Top,
                    multiplier: 1.0,
                    constant: 0)
                let cstBottom:NSLayoutConstraint = NSLayoutConstraint(
                    item: sview,
                    attribute: NSLayoutAttribute.Bottom,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: viewToResize,
                    attribute: NSLayoutAttribute.Bottom,
                    multiplier: 1.0,
                    constant: 0)
                let cstLeading:NSLayoutConstraint = NSLayoutConstraint(
                    item: sview,
                    attribute: NSLayoutAttribute.Leading,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: viewToResize,
                    attribute: NSLayoutAttribute.Leading,
                    multiplier: 1.0,
                    constant: 0)
                let cstTrailing:NSLayoutConstraint = NSLayoutConstraint(
                    item: sview,
                    attribute: NSLayoutAttribute.Trailing,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: viewToResize,
                    attribute: NSLayoutAttribute.Trailing,
                    multiplier: 1.0,
                    constant: 0)
                sview.addConstraints([cstTop, cstBottom, cstTrailing, cstLeading])
                layoutIfNeeded()
            }
        }
    }
    
    @IBAction func doButtonAction(sender: AnyObject) {
        let button = sender as! UIButton
        let color: [UIColor] = [UIColor.redColor(), UIColor.blackColor(), UIColor.yellowColor(), UIColor.brownColor()]
        button.backgroundColor = color[Int(arc4random_uniform(UInt32(color.count)))]
    }
}

extension SimpleView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.yellowColor()
//        print(".... \(cell)")
//        if cell == nil {
//            
//        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        guard let cell = collectionView.cellForItemAtIndexPath(indexPath) else { return }
        print("bkColor: \(cell.backgroundColor)")
        cell.backgroundColor = UIColor.blueColor()
        print("didSelectItemAtIndexPath ...")
    }
}
