//
//  AmigoTableViewCell.swift
//  secondApp
//
//  Created by Juan Antonio Perez Clemente on 16/10/17.
//  Copyright © 2017 Juan Antonio Perez Clemente. All rights reserved.
//

import UIKit

class AmigoTableViewCell: UITableViewCell {
    
    // MARK: propiedades
    @IBOutlet weak var foto: UIImageView!
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var evaluacion: EvaluationControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // FOTOS CIRCULARES
        foto.layer.cornerRadius = foto.frame.size.width / 2
        foto.clipsToBounds = true
        foto.layer.borderWidth = 1.0
        foto.layer.borderColor = UIColor.redColor().CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
