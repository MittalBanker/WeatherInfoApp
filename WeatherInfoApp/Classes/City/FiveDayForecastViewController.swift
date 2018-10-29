//
//  FiveDayForecastViewController.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
class FiveDayForecastViewController: UIViewController, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var collectionView: UICollectionView?
    var placemark: CLPlacemark?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather Information"
        self.collectionView?.register(TodayCell.self, forCellWithReuseIdentifier: "TodayCell")
        collectionView?.register(UINib(nibName: "TodayCell", bundle: nil), forCellWithReuseIdentifier: "TodayCell")

        guard let cOrd = placemark?.location?.coordinate else {
            return
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FiveDayForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 180)
    }

}
