//
//  TweetTableViewCell.swift
//  AprendiendoTablas
//
//  Created by ana on 20/06/20.
//  Copyright © 2020 martin. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    // MARK: - Referencias UI
    @IBOutlet weak var userImageView: UIView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //De la siguiente manera redondeamos
        //La propiedad clipsToBounds es para que no se salga nada de los margenes de la caja
        userImageView.clipsToBounds = true
        //layer trae cornerRadius que nos ayudara a darle un radio, redondeado a nuestra imagen
        //frame.width es igual al ancho
        userImageView.layer.cornerRadius = userImageView.frame.width/2
    }

    //private no permite que la funcion sea utilizada por fuera de su ubicacion
    func setupCell(username: String, message: String){
        usernameLabel.text = username
        messageLabel.text = message
        
    }
    
}
