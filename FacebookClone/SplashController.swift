//
//  SplashController.swift
//  FacebookClone
//
//  Created by Muhammad Zikri Mohd Yunan on 14/09/2022.
//

import UIKit

class SplashController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.performSegue(withIdentifier: "OpenFacebook", sender: nil)
        }
    }

}
