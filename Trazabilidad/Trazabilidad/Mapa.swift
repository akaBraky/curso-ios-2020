//
//  Mapa.swift
//  Trazabilidad
//
//  Created by Samuel Arturo Garrido Sánchez on 9/23/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit
import GoogleMaps

import FirebaseDatabase

class Mapa: UIViewController, CLLocationManagerDelegate{
    var markers = [GMSMarker]()
    func removerMarcadores(mapView: GMSMapView){
        for (index, _) in markers.enumerated() {
            self.markers[index].map = nil
        }
    }
    var ref:DatabaseReference!
    
    func actualizarPosicionLocal(puntoB:String){
        removerMarcadores(mapView: self.mapView!)
        let puntoA = "19.334568,-99.180043"
        let urlString  = "https://maps.googleapis.com/maps/api/directions/json?origin=\(puntoA)&destination=\(puntoB)&key=AIzaSyBn4Uga7u3Ae37I8Ll9u3sVbEsnjZYKtQQ"
        
        guard let url = URL(string: urlString) else {
            print("No se pudo acceder al request")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                    throw JSONError.ConversionFailed
                }
                if let array = json["routes"] as? NSArray {
                    if let routes = array[0] as? NSDictionary{
                        if let overview_polyline = routes["overview_polyline"] as? NSDictionary{
                            if let points = overview_polyline["points"] as? String{
                                print(points)
                                DispatchQueue.main.async {
                                    // mostrar polinomio
                                    let path = GMSPath(fromEncodedPath:points)
                                    let polyline = GMSPolyline(path:path)
                                    polyline.strokeWidth = 5
                                    polyline.strokeColor = UIColor.white
                                    polyline.map = self.mapView
                                }
                            }
                        }
                    }
                }
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            
        })
        task.resume()
        //9ilet marker1 = GMSMarker()
        //pásame latitud y longitud
        
        /*
        var coordenada1 = Float(puntoA)
        var coordenada2 = Float(puntoB)
        marker1.position = CLLocationCoordinate2D(latitude: coordenada1 as CLLocationDegrees, longitude: coordenada2 as CLLocationDegrees)
        marker1.title = "Punto 1"
        marker1.snippet = "UNAM"
        marker1.map = mapView
 */
    }
    
    
    
    
    let locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")

        actualizarPosicionLocal(puntoB: "\(locValue.latitude),\(locValue.longitude)")
        
    }
    @IBOutlet var Textito: UILabel!
    
    func cargarUltimaCoordenada() {
        Textito.text = "Hola"
        ref = Database.database().reference()
        ref.child("Venta").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
            
            if let valorDiccionario = snapshot.value as? [AnyHashable : String]{
                //let nombre1 = valorDiccionario["latitud"]
                //let cantidad1 = valorDiccionario["longitud"]
                //let oferta = Venta(nombre: (nombre1 )!, cantidad: (cantidad1 )!, producto: (producto1 )!, cp: (cp1 )!, numTel: (numTel1 )!)
                //self.ventas.append(oferta)
                
            }
        })
    }
    
    var mapView:GMSMapView?
    
    override func loadView() {
        
        
        super.viewDidLoad()
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        let camera = GMSCameraPosition.camera(withLatitude: +19.331976, longitude: -99.179464, zoom: 15.0)
        mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        do {
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView!.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("No se abrió el diseño")
            }
        } catch {
            NSLog("Salió mal. \(error)")
        }
        
        //Puntos en el mapa
        
       
        
        
        
        
        self.view = mapView
        
        self.title = "Mapa de Track"
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.00, green:0.13, blue:0.52, alpha:1.0)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        
        
        let puntoB = "19.327582,-99.180944"
        let puntoA = "19.334568,-99.180043"
        let urlString  = "https://maps.googleapis.com/maps/api/directions/json?origin=\(puntoA)&destination=\(puntoB)&key=AIzaSyBn4Uga7u3Ae37I8Ll9u3sVbEsnjZYKtQQ"
        
        guard let url = URL(string: urlString) else {
            print("No se pudo acceder al request")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                    throw JSONError.ConversionFailed
                }
                print(json)
                if let array = json["routes"] as? NSArray {
                    if let routes = array[0] as? NSDictionary{
                        if let overview_polyline = routes["overview_polyline"] as? NSDictionary{
                            if let points = overview_polyline["points"] as? String{
                                print(points)
                                DispatchQueue.main.async {
                                    // mostrar polinomio
                                    let path = GMSPath(fromEncodedPath:points)
                                    let polyline = GMSPolyline(path:path)
                                    polyline.strokeWidth = 5
                                    polyline.strokeColor = UIColor.white
                                    polyline.map = self.mapView
                                }
                            }
                        }
                    }
                }
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            
        })
        task.resume()
    }
    
   
    
}
enum JSONError: String, Error {
    case NoData = "ERROR: Nada de data"
    case ConversionFailed = "ERROR: conversión de JSON fallida"
}
