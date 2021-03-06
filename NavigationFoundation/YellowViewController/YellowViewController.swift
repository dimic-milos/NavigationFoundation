//
//  YellowViewController.swift
//  NavigationFoundation
//
//  Created by Milos on 12/21/18.
//  Copyright © 2018 Milos. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }


    @IBAction func buttonDismissTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func buttonShowGreenViewControllerTapped(_ sender: UIButton) {
        show(GreenViewController(), sender: self)
    }
    
    @IBAction func buttonPresentGreenViewControllerTapped(_ sender: UIButton) {
        present(GreenViewController(), animated: true, completion: nil)
    }
    
    @IBAction func buttonPushGreenViewControllerTapped(_ sender: UIButton) {
        navigationController?.pushViewController(GreenViewController(), animated: true)
    }
}
