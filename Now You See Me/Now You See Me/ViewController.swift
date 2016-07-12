//
//  ViewController.swift
//  Now You See Me
//
//  Created by keivn c on 7/11/16.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delagate setup, user location permission and accuracy
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    
        
        // map setup
        var latitude:CLLocationDegrees = 38.246511
        var longitude: CLLocationDegrees = -104.626336
        var latDelta: CLLocationDegrees = 0.05
        var longDelta:CLLocationDegrees = 0.01
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        // annotation setup and add
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Pueblo, Colorado"
        annotation.subtitle = "\(latitude), \(longitude)"
        map.addAnnotation(annotation)
        
        // long press setup, user create own pins
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
    }
    
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        var touchPoint = gestureRecognizer.locationInView(self.map)
        var newCoord: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoord
        annotation.title = "Selected location"
        map.addAnnotation(annotation)
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        var userLocation: CLLocation = locations[0]
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var latDelta: CLLocationDegrees = 0.001
        var longDelta:CLLocationDegrees = 0.001
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        self.map.setRegion(region, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

