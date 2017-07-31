//
//  CarSpotterViewController.swift
//  CarSpotter
//
//  Created by Richard Walters on 31/07/2017.
//  Copyright © 2017 Richard Walters. All rights reserved.
//

import UIKit

class CarSpotterViewController: UIViewController {
    
    @IBOutlet weak var connectionsLabel: UILabel!
    
    @IBAction func redTapped(_ sender: Any) {
        
        self.change(color: .red)
        carSpotterService.send(colorName: "red")
    }
    
    @IBAction func yellowTapped(_ sender: Any) {
        
        self.change(color: .yellow)
        carSpotterService.send(colorName: "yellow")
    }
    
    func change(color : UIColor) {
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = color
        }
    }
    
    // Create service manager to advertise active app over Bluetooth and/or WiFi
    let carSpotterService = CarSpotterServiceManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assign this ViewController as delegate to the advertised service
        carSpotterService.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension CarSpotterViewController : CarSpotterServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: CarSpotterServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionsLabel.text = "Connections: \(connectedDevices)"
        }
    }
    
    func colorChanged(manager: CarSpotterServiceManager, colorString: String) {
        OperationQueue.main.addOperation {
            switch colorString {
            case "red":
                self.change(color: .red)
            case "yellow":
                self.change(color: .yellow)
            default:
                NSLog("%@", "Unknown color value received: \(colorString)")
            }
        }
    }
    
}
