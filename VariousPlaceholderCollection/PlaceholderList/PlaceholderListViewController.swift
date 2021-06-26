//
//  PlaceholderListViewController.swift
//  VariousPlaceholderCollection
//
//  Created by Kohei Hayashi on 2021/06/15.
//

import UIKit

final class PlaceholderListViewController: UIViewController {
    private var tableView: UITableView!

    private let reuseId = String(describing: PlaceholderListTableViewCell.self)
    private var images: [[UIImage?]] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground

        tableView = {
            let tableView = UITableView()
            tableView.dataSource = self
            tableView.separatorInset = .zero
            tableView.register(PlaceholderListTableViewCell.self, forCellReuseIdentifier: reuseId)
            tableView.rowHeight = PlaceholderListTableViewCell.height
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
            return tableView
        }()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 仮の画像取得処理
        images = repeatElement((), count: 5)
            .map { _ in
                repeatElement((), count: 5)
                    .map { _ in (Int.random(in: (100...300)), Int.random(in: (100...300))) }
                    .map { "https://via.placeholder.com/\($0)x\($1)" }
                    .map { UIImage(urlString: $0) }
            }
    }
}
// MARK: - UITableViewDataSource
extension PlaceholderListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? PlaceholderListTableViewCell
        else { fatalError() }
        cell.setup(images: images[indexPath.row])
        return cell
    }
}
// MARK: - Extension
private extension UIImage {
    convenience init?(urlString: String) {
        guard let url = URL(string: urlString) else { return nil }
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        }
        catch {
            return nil
        }
    }
}
