//
//  CustomView.swift
//  Swift
//
//  Created by Adrian Florescu on 17.05.16.
//  Copyright © 2016 infloresc.ro. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView : UIView {
    @IBInspectable
    var color: UIColor? = UIColor.blackColor() { didSet {
        setNeedsDisplay()}
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        self.backgroundColor = UIColor.yellowColor()
        let path = UIBezierPath()
        let padding: CGFloat = 0.0
        path.moveToPoint(CGPoint(x:  padding, y: padding))
        path.addLineToPoint(CGPoint(x: self.bounds.maxX - padding, y: padding))
        path.addLineToPoint(CGPoint(x: self.bounds.maxX - padding, y: self.bounds.maxY - padding))
        path.addLineToPoint(CGPoint(x: padding,                    y: self.bounds.maxY - padding))
        path.addLineToPoint(CGPoint(x: padding,                    y: padding))
//        path.moveToPoint(CGPoint(x: padding + 1, y: padding + 1))
//        path.addLineToPoint(CGPoint(x: self.bounds.midX, y: self.bounds.maxY - padding - 1))
//        path.addLineToPoint(CGPoint(x: self.bounds.maxX - padding - 1, y: padding + 1))
        path.lineWidth = 2.0
        
        color?.setStroke()
        
        print(path.bounds)
        path.applyTransform(CGAffineTransformMakeTranslation(-self.bounds.midX, -self.bounds.midY))
        path.applyTransform(CGAffineTransformMakeRotation(CGFloat(M_PI_2)))
        path.applyTransform(CGAffineTransformMakeTranslation(self.bounds.midY, self.bounds.midX))
//        path.applyTransform(CGAffineTransformTranslate(CGAffineTransformMakeRotation(0.0), self.bounds.midX, self.bounds.midY))
        path.applyTransform(CGAffineTransformMakeScale(0.5, 0.5))

//        path.applyTransform(CGAffineTransformMakeScale(self.bounds.maxX/path.bounds.width, self.bounds.maxY/path.bounds.height))
        print(path.bounds)
        path.stroke()
        
//        self.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
    }
}
