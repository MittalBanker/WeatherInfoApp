//
//  TodayViewController.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//


import UIKit
import Alamofire

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    var _temp: String!
    var _wind: String!
    var date: String{
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weatherType: String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String{
        if _highTemp == nil{
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String{
        if _lowTemp == nil{
            _lowTemp = ""
        }
        return _lowTemp
    }

    var temperature: String{
        if _temp == nil{
            _temp = ""
        }
        return _temp
    }

    var wind: String{
        if _wind == nil{
            _wind = ""
        }
        return _wind
    }

    init(weatherDict: Dictionary<String, AnyObject>){
        
        if let temp = weatherDict["main"] as? Dictionary<String, AnyObject>{
            
             if let max = temp["temp"] as? Double {
                self._temp = String(max)
            }
        }


        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        if let wind = weatherDict["wind"] as? Dictionary<String, AnyObject>{

            if let speed = wind["speed"] as? Float {
                self._wind =  String(speed)
            }
        }
        if let date = weatherDict["dt"] as? Double{
            let unixConvertedData = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedData.dayOfTheWeek()
        }
        
    }
    
}

extension Date{
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
