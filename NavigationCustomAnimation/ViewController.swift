//
//  ViewController.swift
//  NavigationCustomAnimation
//
//  Created by Kevin on 2019/8/30.
//  Copyright © 2019 cn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
        let vc = NextViewController()
        navigationController?.sl_pushViewController(vc, tableView: vc.tableView1, animated: true)
    }
}

