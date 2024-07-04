//
//  ViewController.swift
//  CustomAppUpdate
//
//  Created by sachinpatil-reap on 07/04/2024.
//  Copyright (c) 2024 sachinpatil-reap. All rights reserved.
//

import UIKit
import CustomAppUpdate

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if AppUpdater.isUpdateAvailable(){
            AppUpdater.showUpdateAlert(nav: self.navigationController ?? UINavigationController(), isForceBool: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

