//
//  RedViewController.swift
//  NavigationFoundation
//
//  Created by Milos on 12/21/18.
//  Copyright © 2018 Milos. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }


    @IBAction func buttonDismissTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonShowYellowViewControllerTapped(_ sender: UIButton) {
        navigationController?.show(YellowViewController(), sender: self)
    }
    
    @IBAction func buttonPresentYellowViewControllerTapped(_ sender: UIButton) {
        navigationController?.present(YellowViewController(), animated: true, completion: nil)
    }

}
