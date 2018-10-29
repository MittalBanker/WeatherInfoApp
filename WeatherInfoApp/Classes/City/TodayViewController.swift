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
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
        let rightButtonItem = UIBarButtonItem.init(
            title: "Five Day Forecast",
            style: .done,
            target: self,
            action: #selector(rightButtonAction(sender:)))

        self.navigationItem.rightBarButtonItem = rightButtonItem
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func rightButtonAction(sender: UIBarButtonItem) {
        
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
        if let weather = weatherData {
            cell?.configure(with: weatherData!)
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 150)
    }

}
