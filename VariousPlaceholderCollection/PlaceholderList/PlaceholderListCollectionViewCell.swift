//
//  PlaceholderListCollectionViewCell.swift
//  VariousPlaceholderCollection
//
//  Created by Kohei Hayashi on 2021/06/20.
//

import UIKit

final class PlaceholderListCollectionViewCell: UICollectionViewCell {
    static let height: CGFloat = 200
    private var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        // for self-sizing
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        imageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            contentView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
            return imageView
        }()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        guard let imageSize = imageView.image?.size else { return layoutAttributes }
        let imageAspectRatio: CGFloat = imageSize.width / imageSize.height
        layoutAttributes.size = .init(width: Self.height * imageAspectRatio,
                                      height: Self.height)
        return layoutAttributes
    }

    func setImage(image: UIImage?) {
        imageView.image = image
    }
}
