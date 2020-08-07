//
//  ViewController.swift
//  Trazabilidad
//
//  Created by Samuel Arturo Garrido Sánchez on 9/23/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet var Mapa: GMSMapView!
    
    override func loadView() {
        super.viewDidLoad()
       
        let camera = GMSCameraPosition.camera(withLatitude: +31.75097946, longitude: +35.23694368, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.mapType =  .terrain
        
        // CHANGE THIS
        self.Mapa = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: +31.75097946, longitude: +35.23694368)
        marker.title = "my location"
        marker.map = mapView
    
    }
    
    
    

}

