//
//  CarSpotterViewController.swift
//  CarSpotter
//
//  Created by Richard Walters on 31/07/2017.
//  Copyright © 2017 Richard Walters. All rights reserved.
//

import UIKit

class CarSpotterViewController: UIViewController {
    
    // Create service manager to advertise active app over Bluetooth and/or WiFi
    let carSpotterService = CarSpotterServiceManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

