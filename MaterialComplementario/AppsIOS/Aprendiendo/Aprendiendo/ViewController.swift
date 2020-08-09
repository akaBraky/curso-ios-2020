//
//  ViewController.swift
//  Aprendiendo
//
//  Created by ana on 18/06/20.
//  Copyright © 2020 martin. All rights reserved.
//

import UIKit

//importamos la libreria de nuestro pod
import PopupDialog

class ViewController: UIViewController {
    //MARK: - Referencias UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFIeld: UITextField!
    
    @IBOutlet weak var emailSwitch: UISwitch!
    
    @IBAction func loginButtonAction() {
        //1. Obtener los valores de los TextField
        let email = emailTextField.text
        let password = passwordTextFIeld.text
        
        if email == "martino@gmail.com" && password == "1234" {
            print("Iniciando sesion")
            /*Utilizamos performSegue para movernos desde el flujo de nuestro
             Main.storyboard hacia el Home.storyboard, el primer parametro es
             el identificador del Segue que va al Storyboard Reference el cual
             conecta con Home.storyboard
             */
            
            if emailSwitch.isOn{
                //De esta manera guardamos valores con llave y valor en los UserDafaults.
                storage.set(email, forKey: emailkey)
            } else {
                storage.removeObject(forKey: emailkey)
            }
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            print("contraseña o cuenta invalida")
            //llamamos a la funcion donde implementamso el pod
            showErrorDialog()
        }
        
    }

    private let emailkey = "email-key"
    //La linea de abajo nos va a dar acceso a los valores guardados en el telefono (dentro de la aplicacion)
    private let storage = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //De esta manera buscamos un string en los UserDefaults y lo asignamos
        if let storedEmail = storage.string(forKey: emailkey){
            emailTextField.text = storedEmail
            emailSwitch.isOn = true
        } else {
            emailSwitch.isOn = false
        }
    }
    
    private func showErrorDialog() {
        //TODO EL CODIGO SIGUIENTE ES EL EJEMPLO DE IMPLEMENTACION PARA LA LIBRERIA PopupDialogC
        // Prepare the popup assets
        let title = "THIS IS THE DIALOG TITLE"
        let message = "This is the message section of the popup dialog default view"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

        // This button will not the dismiss the dialog
        let buttonTwo = DefaultButton(title: "ADMIRE CAR", dismissOnTap: false) {
            print("What a beauty!")
        }

        let buttonThree = DefaultButton(title: "BUY CAR", height: 60) {
            print("Ah, maybe next time :)")
        }

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne, buttonTwo, buttonThree])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }


}

