//
//  LocationViewController.swift
//  SwiftLearing
//
//  Created by User on 21/07/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController,CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var geocoder : CLGeocoder = CLGeocoder()
    var placemark : CLPlacemark = CLPlacemark()
    var location = CLLocationCoordinate2D()

    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }


//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//        let stringvalue = "locations = \(locValue.latitude) \(locValue.longitude)"
//        self.label.text = stringvalue
//      
//    }

    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //println("didUpdateToLocation %@",locations)
        
        let currentLocation : CLLocation = locations[0] as CLLocation

            let stringLongitude : NSString = NSString(format: "%0.8f", currentLocation.coordinate.longitude)
            let stringLatitude : NSString = NSString(format: "%0.8f", currentLocation.coordinate.latitude)
            
        locationManager.stopUpdatingLocation()
        
        // 1    send Latitude and Longitude Value
       location = CLLocationCoordinate2D(latitude: Double(stringLatitude as String)!,longitude: Double(stringLongitude as String)!)
        
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        MapView.setRegion(region, animated: true)
        
       
        
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                //println(“Reverse geocoder failed with error” + error.localizedDescription)
                print("Reverse geocode failed with error")
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                // println(“Problem with the data received from geocoder”)
                print("Problem with the date recieved from geocoder")
            }
            
        })
        
        
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        
            
/*            var tempString : String = ""

            if(placemark.locality != nil){
                tempString = tempString +  placemark.locality! + "\n"
            }
            if(placemark.postalCode != nil){
                tempString = tempString +  placemark.postalCode! + "\n"
            }
            if(placemark.administrativeArea != nil){
                tempString = tempString +  placemark.administrativeArea! + "\n"
            }
            if(placemark.country != nil){
                tempString = tempString +  placemark.country! + "\n"
            }

        print(tempString)
        print(placemark.subAdministrativeArea)
        print(placemark.addressDictionary)
        print(placemark.inlandWater)
        print(placemark.location)
        print(placemark.name)
        print(placemark.subLocality)              */
        
        //3   annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = placemark.locality!
        annotation.subtitle = placemark.country!
        MapView.addAnnotation(annotation)

        //  ******** subAdministrativeArea , postalCode , locality , thoroughfare , subThoroughfare , administrativeArea

    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
    
   

}



/*  <---************** Note **************--->
 
 import CoreLocation to your class - probably ViewController.swift
 add CLLocationManagerDelegate to your class declaration
 Add NSLocationWhenInUseUsageDescription and NSLocationAlwaysUsageDescription to plist
 
 */