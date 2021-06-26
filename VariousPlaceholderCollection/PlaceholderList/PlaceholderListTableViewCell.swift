//
//  PlaceholderListTableViewCell.swift
//  VariousPlaceholderCollection
//
//  Created by Kohei Hayashi on 2021/06/20.
//

import UIKit

final class PlaceholderListTableViewCell: UITableViewCell {
    static let height: CGFloat = PlaceholderListCollectionViewCell.height
    private var collectionView: UICollectionView!

    private let reuseId = String(describing: PlaceholderListCollectionViewCell.self)
    private var images: [UIImage?] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 10
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            return layout
        }()

        collectionView = {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .secondarySystemBackground
            collectionView.dataSource = self
            collectionView.register(PlaceholderListCollectionViewCell.self, forCellWithReuseIdentifier: reuseId)
            contentView.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor)
            ])
            return collectionView
        }()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        images = [nil]
    }

    func setup(images: [UIImage?]) {
        self.images = images
    }
}
// MARK: - UICollectionViewDataSource
extension PlaceholderListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? PlaceholderListCollectionViewCell
        else { fatalError() }
        cell.setImage(image: images[indexPath.row])
        return cell
    }
}
