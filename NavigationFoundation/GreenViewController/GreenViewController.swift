//
//  GreenViewController.swift
//  NavigationFoundation
//
//  Created by Milos on 12/24/18.
//  Copyright © 2018 Milos. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

    @IBAction func buttonDismissTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
