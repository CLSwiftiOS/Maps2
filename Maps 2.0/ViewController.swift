//
//  ViewController.swift
//  Maps 2.0
//
//  Created by Christian Liefeldt on 16.02.18.
//  Copyright © 2018 CL. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager = CLLocationManager()

    let letDelta : CLLocationDegrees = 0.005
    let longDelta : CLLocationDegrees = 0.005
   
    
    @IBOutlet weak var oMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        
        let latidude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        
        
        let location = CLLocationCoordinate2D(latitude: latidude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: letDelta, longitudeDelta: longDelta)
        let region = MKCoordinateRegionMake(location, span)
        oMap.showsUserLocation = true
        self.oMap.setRegion(region, animated: true)
        
       
    }

}

