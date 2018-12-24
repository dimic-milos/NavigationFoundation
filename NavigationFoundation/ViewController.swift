//
//  ViewController.swift
//  NavigationFoundation
//
//  Created by Milos on 12/20/18.
//  Copyright © 2018 Milos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonShowRedViewControllerTapped(_ sender: UIButton) {
        navigationController?.show(RedViewController(), sender: self)
    }
    
    @IBAction func buttonPresentRedViewControllerTapped(_ sender: UIButton) {
        navigationController?.present(RedViewController(), animated: true, completion: nil)
    }
    
    @IBAction func buttonPushRedViewControllerTapped(_ sender: UIButton) {
        navigationController?.pushViewController(RedViewController(), animated: true)
    }
}

