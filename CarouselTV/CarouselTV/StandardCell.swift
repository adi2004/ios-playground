//
//  StandardCell.swift
//  CarouselTV
//
//  Created by adrian.florescu on 24.03.2022.
//

import UIKit

class StandardCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var collection: UICollectionView!
//    var opacity: Float = 1.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        isHidden = true
        collection.delegate = self
        collection.dataSource = self
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if isFocused {
            coordinator.addCoordinatedAnimations({
                self.layer.drawX(.green)
//                let a = CGAffineTransform(scaleX: 1.1, y: 1.1)
//                self.layer.setAffineTransform(a)
//                self.layer.opacity = 1.0
//                self.opacity = 1.0
            }, completion: {
//                self.isHidden = false
            })
        } else {
            coordinator.addCoordinatedAnimations({
                self.layer.sublayers?.removeLast()
//                let a = CGAffineTransform(scaleX: 1, y: 1)
//                self.layer.setAffineTransform(a)
//                self.layer.opacity = 0.0
//                self.opacity = 0.0
            }, completion: {
//                self.isHidden = true
            })
        }
    }
}

extension StandardCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as? PosterCell else {
            assertionFailure()
            return UICollectionViewCell()
        }
        
        cell.layer.debug("PosterCVC \(indexPath)")
        return cell
    }
}

extension StandardCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    

}


extension CALayer {
    func debug(_ str: String, _ color: UIColor = .red, border: Bool = true, cross: Bool = false) {
        if cross {
            let path = UIBezierPath.init(rect: self.frame), x = self.frame.width, y = self.frame.height
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: x, y: y))
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: x, y: 0))
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.lineWidth = 3
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = color.cgColor
            self.addSublayer(shapeLayer)
        }

        let textLayer = CATextLayer()
        textLayer.string = str
        textLayer.foregroundColor = color.cgColor
        textLayer.alignmentMode = .left
        textLayer.fontSize = 25
        textLayer.frame = CGRect(x: 3, y: 3, width: 500, height: 100)
        var replaced = false
        for l in sublayers ?? [] where l is CATextLayer {
            replaceSublayer(l, with: textLayer)
            replaced = true
            break
        }
        if !replaced {
            self.addSublayer(textLayer)
        }
        
        if border {
            self.borderColor = color.cgColor
            self.borderWidth = 3.0
        }
    }
    
    func drawX(_ color: UIColor) {
        let path = UIBezierPath.init(rect: self.frame), x = self.frame.width, y = self.frame.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: x, y: y))
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: x, y: 0))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        self.addSublayer(shapeLayer)
    }
}
