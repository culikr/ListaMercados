//
//  MercadoTableViewCell.swift
//  Lista de Mercados
//
//  Created by iossenac on 17/09/16.
//  Copyright © 2016 culik. All rights reserved.
//

import UIKit

class MercadoTableViewCell: UITableViewCell {

    @IBOutlet weak var segmento: UILabel!
    
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var numloja: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure( _ segmento:String,_ nome:String,_ numloja:Int){
        self.segmento.text = segmento
        self.nome.text=nome
        self.numloja.text = "\(numloja)"
    }

}
