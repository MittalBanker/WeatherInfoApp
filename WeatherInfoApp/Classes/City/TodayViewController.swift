//
//  TodayViewController.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
class TodayViewController: UIViewController, UICollectionViewDelegateFlowLayout{
    var placemark: CLPlacemark?
    var weatherData: WeatherTuple?
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var segControl: UISegmentedControl?
    @IBOutlet weak var tblView: UITableView?
    var forecaste = [Forecast]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather Information"
        self.collectionView?.register(TodayCell.self, forCellWithReuseIdentifier: "TodayCell")
        collectionView?.register(UINib(nibName: "TodayCell", bundle: nil), forCellWithReuseIdentifier: "TodayCell")

        guard let cOrd = placemark?.location?.coordinate else {
            return
        }
        WeatherApi.shared.weather(coordinate: cOrd) { result in
            switch result {
            case .success(let temp, let h, let m, let k) :
                self.weatherData = (temperature: temp, description: h, humidity: m, wind: k)
            case .failure(let err): break

            }
            self.callForecast(coordinate: cOrd)
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentChanged(_ sender: Any) {
        guard ((sender as? UISegmentedControl)?.selectedSegmentIndex) != nil else {
            return
        }
        if ((sender as? UISegmentedControl)?.selectedSegmentIndex) == 0 {
            collectionView?.isHidden = false
            tblView?.isHidden = true
        } else {
            tblView?.isHidden = false
            collectionView?.isHidden = true
        }
    }

    func callForecast(coordinate: CLLocationCoordinate2D) {
        WeatherApi.shared.downloadForecastData(coordinate: coordinate) { (result) in
            self.forecaste = result
            self.tblView?.reloadData()
        }
    }
}

extension TodayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    //1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    //2
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    //3
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayCell",
                                                      for: indexPath) as? TodayCell
        // Configure the cell
        if weatherData != nil {
            cell?.configure(with: weatherData!)
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 150)
    }

}

extension TodayViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecaste.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecaste[indexPath.row]
            cell.confifureCell(forecast: forecast)
            return cell
        }
        return WeatherCell()
    }
}
