//
//  CollectionViewCell.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 24.10.2022.
//

import UIKit
import Combine

class CollectionViewCell: UICollectionViewCell {
    var cancellables = Set<AnyCancellable>()

    override func prepareForReuse() {
        cancellables.removeAll()
    }

    func configure() {
        backgroundColor = .random
        Timer.publish(every: 1, tolerance: 1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.backgroundColor = .random
            }.store(in: &cancellables)
    }
}
