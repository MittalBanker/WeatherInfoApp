//
//  SettingsViewController.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import Foundation
import UIKit
class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func unitChanged(_ sender: Any) {
        let segment = sender as? UISegmentedControl
        Utils.setDefaults(key: GlobalConstants.unit, value: segment?.selectedSegmentIndex == 0 ? "matric" : "imperial" )
    }


    @IBAction func resetCities(_ sender: Any) {
        AppDelegate.appDelegate.placeMarkArr.removeAll()
    }

}
