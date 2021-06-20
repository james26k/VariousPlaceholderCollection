//
//  PlaceholderListTableViewCell.swift
//  VariousPlaceholderCollection
//
//  Created by Kohei Hayashi on 2021/06/20.
//

import UIKit

final class PlaceholderListTableViewCell: UITableViewCell {
    static let height: CGFloat = 200
    private var collectionView: UICollectionView!

    private let reuseId = String(describing: UICollectionViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.scrollDirection = .horizontal
            return layout
        }()

        collectionView = {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .secondarySystemBackground
            collectionView.dataSource = self
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseId)
            contentView.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
                collectionView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                collectionView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor)
            ])
            return collectionView
        }()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlaceholderListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Int.random(in: (5...20))
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
        cell.backgroundColor = .systemIndigo
        return cell
    }
}
