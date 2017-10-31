//
//  Amigo.swift
//  secondApp
//
//  Created by Juan Antonio Perez Clemente on 9/10/17.
//  Copyright © 2017 Juan Antonio Perez Clemente. All rights reserved.
//

import UIKit

class Amigo: NSObject, NSCoding{
    
    //MARK: atributos
    var nombre: String
    var foto: UIImage?
    var gradoAfinidad: Int
    
    
    static let directorio = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let amigoURL = directorio.URLByAppendingPathComponent("listadoAmigos")
    
    //MARK: Inicialización
    init?(nombre: String, foto: UIImage?, gAfinidad: Int){
        self.nombre = nombre
        self.foto = foto
        self.gradoAfinidad = gAfinidad
        
        super.init()
        
        if nombre.isEmpty || gAfinidad < 0 {
            return nil
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let nombre = aDecoder.decodeObjectForKey("Nombre") as! String
        let foto = aDecoder.decodeObjectForKey("Foto") as? UIImage
        let gradoAfinidad = aDecoder.decodeIntegerForKey("GradoAfinidad")
        
        self.init(nombre: nombre, foto: foto, gAfinidad: gradoAfinidad)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(nombre, forKey: "Nombre")
        aCoder.encodeObject(foto, forKey: "Foto")
        aCoder.encodeInteger(gradoAfinidad, forKey: "GradoAfinidad")
    }
}
