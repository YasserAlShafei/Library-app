//
//  MapVC.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 12/1/21.
//

import UIKit
import MapKit


class MapVC: UIViewController {

    @IBOutlet weak var mapView :MKMapView!
    let latitude = 31.354675
    let longitude = 34.308826
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Lat: 31.354675 - Log: 34.308826

        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = "The Our Location"
        annotation.subtitle = "Maktabati"
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(region, animated: true)
        
        
    }
    

}
