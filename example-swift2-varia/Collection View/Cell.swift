//
//  Cell.swift
//  Swift
//
//  Created by Adrian Florescu on 09.05.16.
//  Copyright © 2016 infloresc.ro. All rights reserved.
//

import UIKit

class Cell:UICollectionViewCell {
    @IBAction func doButtonAction(sender: AnyObject) {
        print("Doing action in Cell...")
        ((sender as! UIButton).superview as UIView?)!.backgroundColor = UIColor.cyanColor()
    }
    
}
