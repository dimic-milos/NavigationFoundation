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
    
    @IBAction func buttonPopViewControllerTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonPopToRedViewControllerTapped(_ sender: UIButton) {
        guard let redViewController = navigationController?.viewControllers[1] as? RedViewController else { return }
        navigationController?.popToViewController(redViewController, animated: true)
    }
    
    @IBAction func buttonPopToRootViewControllerTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func buttonSetViewControllersTapped(_ sender: UIButton) {
        guard let redViewController = navigationController?.viewControllers[1] as? RedViewController else { return }
        guard let yellowViewController = navigationController?.viewControllers[2] as? YellowViewController else { return }
        navigationController?.setViewControllers([yellowViewController, redViewController], animated: true)
    }
}
