//
//  mapViewViewController.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit
class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let longPressRecogniser = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.handleLongPress(_:)))
        longPressRecogniser.minimumPressDuration = 1.0
        mapView?.addGestureRecognizer(longPressRecogniser)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func viewChanged(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }

    @objc func handleLongPress(_ gestureRecognizer:UIGestureRecognizer){
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            var touchPoint = gestureRecognizer.location(in: mapView)
            var newCoordinates = mapView?.convert(touchPoint, toCoordinateFrom: mapView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = newCoordinates!

            CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: (newCoordinates?.latitude)!, longitude: (newCoordinates?.longitude)!), completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                    return
                }

                if placemarks?.count ?? 0 > 0 {
                    if let pm = placemarks![0] as? CLPlacemark
                    {
                    // not all places have thoroughfare & subThoroughfare so validate those values
                    annotation.title = pm.subAdministrativeArea
                    annotation.subtitle = pm.subLocality
                    AppDelegate.appDelegate.placeMarkArr.append(pm)
                    self.mapView?.addAnnotation(annotation)
                    print(pm)
                    }
                }
                else {
                    annotation.title = "Unknown Place"
                    self.mapView?.addAnnotation(annotation)
                    print("Problem with the data received from geocoder")
                }
                //placemarks.append(["name":annotation.title,"latitude":"\(newCoordinates.latitude)","longitude":"\(newCoordinates.longitude)"])
            })
        }
    }
}
