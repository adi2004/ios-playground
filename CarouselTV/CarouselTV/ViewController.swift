//
//  ViewController.swift
//  CarouselTV
//
//  Created by adrian.florescu on 24.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var selectedViewLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = .init(top: 500, left: 0, bottom: 0, right: 0)
//        collectionView.dele
        collectionView.isScrollEnabled = false
        
        view.layer.borderColor = UIColor.blue.cgColor
        view.layer.borderWidth = 3.0
        collectionView.layer.borderColor = UIColor.green.cgColor
        collectionView.layer.borderWidth = 5.0
        collectionView.layer.debug("collectionView", .blue)
        view.layer.debug("view")
        selectedViewLabel.layer.debug("selectedViewLabel")
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StandardCell", for: indexPath) as? StandardCell else {
            assertionFailure()
            return UICollectionViewCell()
        }
        
        cell.name.text = "\(indexPath.row)"
        cell.layer.borderWidth = 2
        cell.layer.opacity = cell.opacity
        cell.layer.debug("StandardCVC \(indexPath)", .yellow)
        return cell
    }
//    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
//        if let focusView = context.nextFocusedView as? UICollectionViewCell, let indexPath = collection.indexPath(for: focusView) {
//
//            collection.isScrollEnabled = false
//            coordinator.addCoordinatedAnimations({
//                self.collection.scrollToItem(at: indexPath, at: .left, animated: true)
//            }, completion: nil)
//        }
//    }
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let next = context.nextFocusedIndexPath {
            let cell = collectionView.cellForItem(at: next)
            coordinator.addCoordinatedAnimations {
                cell?.layer.opacity = 1
                self.collectionView.scrollToItem(at: next, at: .bottom, animated: false)
            } completion: {}
            
        }
        if let previous = context.previouslyFocusedIndexPath {
            let cell = collectionView.cellForItem(at: previous)
            coordinator.addCoordinatedAnimations {
                cell?.layer.opacity = 0.01
            } completion: {}
        }
//        guard let previous = context.previouslyFocusedIndexPath, let next = context.nextFocusedIndexPath else {
//            return
//        }
//        if previous.row + 1 == next.row {
//            let cell = collectionView.cellForItem(at: previous)
//            coordinator.addCoordinatedAnimations {
//                cell?.layer.opacity = 0.1
//            } completion: {
//
//            }
//        }
//        if next.row != 1 {
//            collectionView.contentInset = UIEdgeInsets(top: 400, left: 0, bottom: 0, right: 0)
//        } else {
//            let cell = collectionView.cellForItem(at: next)
//            cell?.layer.opacity = 1.0
//            collectionView.contentInset = .zero
//        }
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
//        return true
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 1 {
            return CGSize(width: 1920, height: 866)
        } else {
            return CGSize(width: 1920, height: 336)
        }
    }
}


