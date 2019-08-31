//
//  NextViewController.swift
//  NavigationCustomAnimation
//
//  Created by Kevin on 2019/8/30.
//  Copyright © 2019 cn. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var tableView1: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView1)
    }

    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}


extension NextViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellid")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cellid")
        }
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }
}
