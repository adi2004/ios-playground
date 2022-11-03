//
//  CollectionViewCell.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 24.10.2022.
//

import UIKit
import Combine

class OneTimerMultipleSubscriptionsCell: UICollectionViewCell {
    var cancellables = Set<AnyCancellable>()

    override func prepareForReuse() {
        cancellables.removeAll()
    }

    func configure() {
        backgroundColor = .random
    }
}
