//
//  Amigo.swift
//  secondApp
//
//  Created by Juan Antonio Perez Clemente on 9/10/17.
//  Copyright © 2017 Juan Antonio Perez Clemente. All rights reserved.
//

import UIKit

class Amigo{
    
    //MARK: atributos
    var nombre: String
    var foto: UIImage?
    var gradoAfinidad: Int
    
    //MARK: Inicialización
    init?(nombre: String, foto: UIImage?, gAfinidad: Int){
        self.nombre = nombre
        self.foto = foto
        self.gradoAfinidad = gAfinidad
        
        if nombre.isEmpty || gAfinidad < 0 {
            return nil
        }
    }
}
