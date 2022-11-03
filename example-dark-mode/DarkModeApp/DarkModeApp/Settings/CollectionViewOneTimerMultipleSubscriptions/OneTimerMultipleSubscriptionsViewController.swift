//
//  CollectionViewController.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 24.10.2022.
//

import UIKit
import Combine

private let reuseIdentifier = "OneTimerMultipleSubscriptionsCell"

class OneTimerMultipleSubscriptionsViewController: UICollectionViewController {
    var currentTimerPublisher: AnyPublisher<Date, Never>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(OneTimerMultipleSubscriptionsCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        currentTimerPublisher = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect().eraseToAnyPublisher()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5_000
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OneTimerMultipleSubscriptionsCell
        currentTimerPublisher
            .sink { [weak cell] _ in
                cell?.configure()
            }.store(in: &cell.cancellables)
        return cell
    }
}
