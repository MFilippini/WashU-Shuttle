//
//  LocationManager.swift
//  WashU Shuttle
//
//  Created by Jacky Zhang on 11/17/21.
//

import UIKit
import CoreLocation

class LocationManager : UIViewController, CLLocationManagerDelegate {
    var locationManager:CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func determineUserLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
}

func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

        switch status {
        case .notDetermined:
            print("notDetermined")
            manager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
            // Inform user about the restriction
            break
        case .denied:
            print("deined")
            // The user denied the use of location services for the app or they are disabled globally in Settings.
            // Direct them to re-enable this.
            break
        case .authorizedAlways, .authorizedWhenInUse:
            print("authorized")
            manager.requestLocation()
        }
    }

func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let userLocation:CLLocation = locations[0] as CLLocation
    
    // Call stopUpdatingLocation() to stop listening for location updates,
    // other wise this function will be called every time when user location changes.
    
   // manager.stopUpdatingLocation()
    
    print("user latitude = \(userLocation.coordinate.latitude)")
    print("user longitude = \(userLocation.coordinate.longitude)")
}

func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
{
    print("Error")
}
