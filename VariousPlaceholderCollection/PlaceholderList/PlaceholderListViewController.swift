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
}
// MARK: - UITableViewDataSource
extension PlaceholderListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? PlaceholderListTableViewCell
        else { fatalError() }
        return cell
    }
}
