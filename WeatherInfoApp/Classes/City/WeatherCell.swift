//
//  WeatherCell.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 31/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    
    
    
    func confifureCell(forecast: Forecast)  {
        windLbl.text = "Wind" + forecast._wind + "m/s"
        highTemp.text = forecast.temperature
        weatherType.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }

}
