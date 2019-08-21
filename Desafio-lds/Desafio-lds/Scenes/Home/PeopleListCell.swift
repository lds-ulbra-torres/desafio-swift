//
//  CelulaListaDePessoasTableViewCell.swift
//  Desafio-lds
//
//  Created by Jaisson Monteiro on 18/08/19.
//  Copyright © 2019 Jaisson Monteiro. All rights reserved.
//

import UIKit

class PeopleListCell: UITableViewCell {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var alturaLabel: UILabel!
    @IBOutlet weak var nascimentoLabel: UILabel!
    
    func updateCell(with people : Person) {
        self.nomeLabel.text = people.name
        self.alturaLabel.text = "Altura: \(people.height)"
        self.nascimentoLabel.text = "Massa: \(people.mass)"
    }

}
