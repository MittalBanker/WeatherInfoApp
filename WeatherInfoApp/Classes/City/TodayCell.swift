//
//  TodayCell.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 29/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import Foundation
import UIKit
class TodayCell: UICollectionViewCell {
    @IBOutlet var humidityLbl: UILabel?
    @IBOutlet var tempLbl: UILabel?
    @IBOutlet var windLbl: UILabel?
    @IBOutlet var rainLbl: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with model: WeatherTuple) {
        humidityLbl?.text = String(model.humidity)
        tempLbl?.text = String(model.temperature) + "°"
        windLbl?.text = String(model.wind) + "m/s"
        rainLbl?.text = model.description
    }
}
