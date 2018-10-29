//
//  ViewController.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var noDataLbl: UILabel?
    var tappedIndex:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.estimatedRowHeight = 40
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.register(UINib(nibName: "LocationCell", bundle: nil), forCellReuseIdentifier: "LocationCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func viewChanged(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController {
            viewController.modalTransitionStyle = .flipHorizontal
            present(viewController, animated: true)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "gototodayscreen" {
            let todayViewController = segue.destination as? TodayViewController
            todayViewController?.placemark = AppDelegate.appDelegate.placeMarkArr[tappedIndex ?? 0]
        }
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        noDataLbl?.isHidden = AppDelegate.appDelegate.placeMarkArr.count > 0 ? true : false
        return AppDelegate.appDelegate.placeMarkArr.count
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LocationCell = self.tableView?.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationCell
        cell.locationLbl?.text = Utils.getAddress(pm: AppDelegate.appDelegate.placeMarkArr[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if (editingStyle == .delete) {
            tableView.beginUpdates()
            AppDelegate.appDelegate.placeMarkArr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            tableView.endUpdates()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tappedIndex = indexPath.row
      performSegue(withIdentifier: "gototodayscreen", sender: nil)
    }
}

