//
//  MapViewController.swift
//  TwitterAuthentication
//
//  Created by Chirag Vekariya on 26/12/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: -
    // MARK: - Variable
    var coordinate: UserCoordinate?
    
    // MARK: -
    // MARK: - Outlet
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: -
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetUp()
    }
    
}

// MARK: -
// MARK: - SetUp Methods
extension MapViewController {
    
    private func initialSetUp() {
        setUpMapCoordinate()
    }
    
    private func setUpMapCoordinate() {
        if let coordinate = coordinate, let latitude = Double(coordinate.latitude ?? ""), let longitude = Double(coordinate.longitude ?? "") {
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            let region = MKCoordinateRegion(center: coordinates, span: span)
            mapView.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            annotation.title = AppString.mapTitle()
            mapView.addAnnotation(annotation)
        }
    }
    
}
