//
//  CollectionViewController.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 24.10.2022.
//

import UIKit
import Combine

private let reuseIdentifier = "CollectionViewOneTimerCell"

class CollectionOneTimerViewController: UICollectionViewController {
    var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(CollectionViewOneTimerCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        Timer.publish(every: 1, tolerance: 10, on: .main, in: .default)
            .autoconnect()
            .sink { _ in
                self.collectionView.reloadData()
            }.store(in: &cancellables)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5_00
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewOneTimerCell
        cell.configure()
        return cell
    }
}
