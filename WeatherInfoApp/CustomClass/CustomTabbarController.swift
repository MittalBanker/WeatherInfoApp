//
//  CustomTabbarController.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import Foundation
import UIKit
class CustomTabbarController : UITabBarController {

    override func viewDidLoad() {

        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let firstViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {

            let navigationController = UINavigationController(rootViewController: firstViewController)
            navigationController.title = "Home"
            navigationController.tabBarItem.image = UIImage.init(named: "ic_home")


            viewControllers = [navigationController]
        }
        if let helpViewController = storyboard.instantiateViewController(withIdentifier: "HelpViewController") as? HelpViewController {

            let navgitaionController1 = UINavigationController(rootViewController: helpViewController)
            navgitaionController1.title = "Help"
            navgitaionController1.tabBarItem.image = UIImage.init(named: "ic_help")
            var array = self.viewControllers
            array?.append(navgitaionController1)
            self.viewControllers = array

        }
        if let secondViewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController {

            let navgitaionController1 = UINavigationController(rootViewController: secondViewController)
            navgitaionController1.title = "Settings"
            navgitaionController1.tabBarItem.image = UIImage.init(named: "ic_settings")
            var array = self.viewControllers
            array?.append(navgitaionController1)
            self.viewControllers = array

        }
    }
}
