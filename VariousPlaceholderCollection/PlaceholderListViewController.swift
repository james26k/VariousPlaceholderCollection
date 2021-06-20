//
//  PlaceholderListViewController.swift
//  VariousPlaceholderCollection
//
//  Created by Kohei Hayashi on 2021/06/15.
//

import UIKit

final class PlaceholderListViewController: UIViewController {
    // MARK: - UI
    private var tableView: UITableView!

    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground

        tableView = {
            let tableView = UITableView()
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
        // Do any additional setup after loading the view.
    }


}

