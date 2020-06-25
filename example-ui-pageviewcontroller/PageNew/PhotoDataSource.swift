//
//  PhotoDataSource.swift
//  PKVGeomedis
//
//  Created by Adrian Florescu on 14.09.17.
//  Copyright © 2017 . All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject, UIPageViewControllerDataSource {
    var index = 0
    override init() {
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vcStory = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let photoVC = vcStory.instantiateViewController(withIdentifier: PageViewController.kID) as? PageViewController else { return nil }
        guard let currentVC = viewController as? PageViewController else { fatalError("Unknown VC") }
        let currentPhotoIndex = currentVC.dataSource - 1
        index = currentPhotoIndex
        print("before, value: \(currentPhotoIndex)")
        photoVC.dataSource =  currentPhotoIndex
        return photoVC
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vcStory = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let photoVC = vcStory.instantiateViewController(withIdentifier: PageViewController.kID) as? PageViewController else { return nil }
        guard let currentVC = viewController as? PageViewController else { fatalError("Unknown VC") }
        let currentPhotoIndex = currentVC.dataSource + 1
        index = currentPhotoIndex
        print("after, value: \(currentPhotoIndex)")
        photoVC.dataSource = currentPhotoIndex
        return photoVC
    }

    // A page indicator will be visible if both methods are implemented, transition style is 'UIPageViewControllerTransitionStyleScroll', and navigation orientation is 'UIPageViewControllerNavigationOrientationHorizontal'.
    // Both methods are called in response to a 'setViewControllers:...' call, but the presentation index is updated automatically in the case of gesture-driven navigation.
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 10
    }

    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        print(pageViewController.viewControllers?.count ?? -100)
        guard let vc = pageViewController.viewControllers?.first as? PageViewController else { fatalError("Unknown VC") }
        return vc.dataSource
    }
}
