//
//  ViewControllerWithTableView.swift
//  TableViewAutoSize+ScrollView+CollectionView
//
//  Created by Данил on 30.01.2022.
//

import UIKit

//MARK: Чтобы сделать self size cell
//MARK: 1) rowHeight = UITableView.automaticDimension
//MARK: 2) Также как в scrollView указать размеры по вертикали
//MARK: Чтобы сделать self size cell


class ViewControllerWithTableView: UIViewController {

    private var messages = Message.fetchAll()
    
    private let rightID = "rightCell"
    private let leftID = "leftCell"
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .gray
        tableView.allowsSelection = false

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.register(RightMessageCell.self, forCellReuseIdentifier: rightID)
        tableView.register(LeftMessageCell.self, forCellReuseIdentifier: leftID)
        
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}

extension ViewControllerWithTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        var cell: BaseCell
        if message.sentByMe {
          cell = tableView.dequeueReusableCell(
            withIdentifier: rightID,
            for: indexPath) as! RightMessageCell
        } else {
          cell = tableView.dequeueReusableCell(
            withIdentifier: leftID,
            for: indexPath) as! LeftMessageCell
        }
        cell.messageLabel.text = message.text
        return cell
    }
    
}
