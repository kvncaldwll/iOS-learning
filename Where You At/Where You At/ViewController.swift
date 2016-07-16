//
//  ViewController.swift
//  Where You At
//
//  Created by keivn c on 7/11/16.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        // locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        var userLocation: CLLocation = locations[0]
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        self.longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        self.courseLabel.text = "\(userLocation.course)"
        self.speedLabel.text = "\(userLocation.speed)"
        self.altitudeLabel.text = "\(userLocation.altitude)"
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            
            if error != nil {
                print(error)
            } else {
//                if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
////                    self.addressLabel.text = p.address
//                }
                
                if placemarks != nil {
                    let actualPlacemarks = placemarks!
                    let firstPlacemark = actualPlacemarks[0]
                    
                    //check for sub thouroughfare info
                    var subThoroughfare = ""
                    
                    if firstPlacemark.subThoroughfare != nil {
                        subThoroughfare = firstPlacemark.subThoroughfare!
                    }
                    
                    self.addressLabel.text = "\(subThoroughfare) \(firstPlacemark.thoroughfare) \n \(firstPlacemark.subLocality) \n \(firstPlacemark.subAdministrativeArea) \n \(firstPlacemark.postalCode) \n \(firstPlacemark.country)"
                }
                
//                if let actualPlacemarks = placemarks {
//                    print(actualPlacemarks)
//                }
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

