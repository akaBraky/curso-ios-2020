//
//  ViewController.swift
//  IndiceMC
//
//  Created by Samuel Arturo Garrido Sánchez on 1/17/20.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var peso: UITextField!
    
    @IBOutlet weak var talla: UITextField!
    @IBOutlet weak var IMC: UILabel!
    
    
    let estados:[String] = ["Desnutrido","Normal","Sobrepeso","Obesidad Ligera","Obesidad Moderada","Obesidad Severa"]
    let imagenes:[String] = ["1","2","3","4","5","6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calculadora de IMC - Proteco"
        self.dismissKey()
    }
    @IBAction func pesoEdit(_ sender: Any) {
        guard let kg = Double(peso.text!), let m = Double(talla.text!)
        else {
            IMC.text = "0"
            return
        }
        
        if(Double(talla.text!))==0{
            return
        }
        
        let Imccal:Double = kg/(pow(m,2))
        
        IMC.text = String(format: "%.2f", Imccal)
        
    }
    @IBOutlet var imagen: UIImageView!
    
    @IBOutlet var resultado: UILabel!
    
    @IBAction func tallaEdit(_ sender: Any) {
       guard let kg = Double(peso.text!), let m = Double(talla.text!)
        else {
            IMC.text = "0"
            return
        }
        
        if(Double(talla.text!))==0{
            return
        }
        
        let Imccal:Double = kg/(pow(m,2))
        
        IMC.text = String(format: "%.2f", Imccal)
        
        //No se puede un switch porque hablamos de valores decimales
        if Imccal<18.5{
            resultado.text = estados[0]
            imagen.image = UIImage(named: imagenes[5])
        }else{
            if Imccal >= 18.5 && Imccal < 25{
                resultado.text = estados[1]
                imagen.image = UIImage(named: imagenes[4])
            }else{
                if Imccal >= 25 && Imccal<30{
                    resultado.text = estados[2]
                    imagen.image = UIImage(named: imagenes[3])
                }else{
                    if Imccal >= 30 && Imccal<35{
                        resultado.text = estados[3]
                        imagen.image = UIImage(named: imagenes[2])
                    }else{
                        if Imccal >= 35 && Imccal<40{
                            resultado.text = estados[4]
                            imagen.image = UIImage(named: imagenes[1])
                        }else{
                            if Imccal >= 40{
                                resultado.text = estados[5]
                                imagen.image = UIImage(named: imagenes[0])
                        }
                    }
                }
            }
        }
        
    }
    }
    
}




extension UIViewController {
func dismissKey()
{
let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
}
@objc func dismissKeyboard()
{
view.endEditing(true)
}
}
