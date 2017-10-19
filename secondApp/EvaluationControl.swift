//
//  EvaluationControl.swift
//  secondApp
//
//  Created by Juan Antonio Perez Clemente on 9/10/17.
//  Copyright © 2017 Juan Antonio Perez Clemente. All rights reserved.
//

import UIKit

class EvaluationControl: UIView {

    // MARK: inicializacioón
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        for i in 0..<5{
            let boton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            
            boton.setImage(UIImage(named:"Estrella vacia"), forState: .Normal)
            boton.setImage(UIImage(named:"Estrella rellena"), forState: .Selected)
            boton.adjustsImageWhenHighlighted = false
            boton.addTarget(self, action: #selector(btnEval(_:)), forControlEvents: .TouchDown)
            boton.tag = i + 1
            
            botones += [boton]
            addSubview(boton)
        }
    }
    
    // MARK: atributos
    var gradoAfinidad = 0 {
        didSet{ actualizaEstrellas() }
    }
    var botones = [UIButton]()
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    override func layoutSubviews() {
        
        let alto = self.frame.size.height
        let espacioLibre = Int(Int(self.frame.size.width) - Int(alto) * botones.count)
        let espaciado = Int(espacioLibre / botones.count)
        
        for(i, boton) in botones.enumerate(){
            boton.frame.origin.x = CGFloat(i * (Int(alto) + espaciado))
            boton.frame.size.height = alto
            boton.frame.size.width = alto
        }
        
        actualizaEstrellas()
    }
    
    func btnEval(boton: UIButton) {
        //print("Botón \(boton.tag) Pulsado 👍")
        
        gradoAfinidad = botones.indexOf(boton)! + 1
    }
    
    func actualizaEstrellas(){
        for (i, botonI) in botones.enumerate(){
            botonI.selected = gradoAfinidad > i
        }
    }

}
