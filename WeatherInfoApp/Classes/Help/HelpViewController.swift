//
//  HelpViewController.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import Foundation
import UIKit
import WebKit
class HelpViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        //load a file
        webView = WKWebView()
        webView?.navigationDelegate = self
        view = webView
        if let url = Bundle.main.url(forResource: "help", withExtension: "html", subdirectory: nil) {
        webView?.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView?.load(request)
        }
    }
}
