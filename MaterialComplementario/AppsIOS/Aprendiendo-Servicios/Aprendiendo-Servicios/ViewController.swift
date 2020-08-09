//
//  ViewController.swift
//  Aprendiendo-Servicios
//
//  Created by ana on 21/07/20.
//  Copyright © 2020 martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Referencias UI
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var statusLabel:UILabel!
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchService()
    }
    
    
    //Un metodo para poder consumir el servicio
    // Endpoint: http://www.mocky.io/v2/5e2674472f00002800a4f417
    // 1. Crear excepcion de seguridad. Las aplicaciones en ios no aceptan dejan conectarte a dominios que no sean https.
    // 2. Crear URL con el endpoint
    // 3. Hacer request con la ayuda de URLSession
    // 4. Transformar respuesta a diccionario
    // 5. Ejecutar request
    private func fetchService() {
        
        //2. Crear URL con el endpoint
        let endpointString = "http://www.mocky.io/v2/5e2674472f00002800a4f417"
        
        guard let endpoint = URL(string: endpointString) else {
            return
        }
        
        //Empezamos la animacion antes de que arranque el servicio
        activityIndicator.startAnimating()
        
        //3. Hacer request con la ayuda de URLSession
        URLSession.shared.dataTask(with: endpoint) { (data: Data?, _, error: Error?) in
            
            /*Cuando el servicio se complete vamos a detener la animacion.
             Igualmente el cambio se tiene que hacer en el hilo principal porque es un cambio en la UI */
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
            
            if error != nil {
                print("Hubo un error")
                return
            }
            
        /*4. Transformar respuesta a diccionario
             Invocamos un metodo que podria fallar o no fallar
             jsonObject nos esta pidiendo un data pero sin ser opcional
             dataFromService nos asegura que la variable existe si data existe
             Estamos intentando convertir data a un diccionario
             Por eso le decimos a nuestro guard que haremos un casteo (as? [String: Any]) para indicar que podria ser un diccionario
        */
            guard let dataFromService = data, let dictionary = try? JSONSerialization.jsonObject(with: dataFromService, options: []) as? [String: Any] else {
                return
            }
            
            
            //EL servicio que estamos consumiendo se esta haciendo en un hilo secundario.
            
            /*Finalmente mandamos a nuestro label el contenido del diccionario con la clave "user", tambien hacemos su respectivo casteo.
             Pero todos los cambios que hagamos en la interfaz se tienen que hacer en el mainthread*/
            
            //Usamos DispatchQueue.main.async para poder mover a una ejecuccion en un hilo principal
            //Importante: TODOS los llamados a la UI, se hacen en el main thread (pregunta de entrevista)
            DispatchQueue.main.async {
                let isHappy = dictionary["isHappy"] as? Bool ?? false
                
                self.nameLabel.text = dictionary["user"] as? String
                self.statusLabel.text = isHappy ? "Es feliz!" : "Es triste"
            }
            
        }.resume() //5. Ejecutar request NO OLVIDAR EL .resume()
        
    }

}

