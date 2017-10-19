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
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
