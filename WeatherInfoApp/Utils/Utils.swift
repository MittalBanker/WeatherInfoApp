//
//  Utils.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import Foundation
import CoreLocation
class Utils: NSObject {
    static func  setDefaults(key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key) //setObject
        UserDefaults.standard.synchronize()
    }
    
    static func getDefaults(key: String) -> String? {
        let returnValue: String? = UserDefaults.standard.object(forKey: key)  as? String
        return returnValue
    }

    static func getAddress(pm: CLPlacemark) -> String {
        var addressString : String = ""
        if pm.subLocality != nil {
            addressString = addressString + pm.subLocality! + ", "
        }
        if pm.thoroughfare != nil {
            addressString = addressString + pm.thoroughfare! + ", "
        }
        if pm.locality != nil {
            addressString = addressString + pm.locality! + ", "
        }
        if pm.country != nil {
            addressString = addressString + pm.country! + ", "
        }
        if pm.postalCode != nil {
            addressString = addressString + pm.postalCode! + " "
        }
        return addressString
    }
}
