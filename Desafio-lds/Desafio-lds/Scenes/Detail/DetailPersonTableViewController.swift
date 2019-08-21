//
//  DetalhesPessoaViewController.swift
//  Desafio-lds
//
//  Created by Jaisson Monteiro on 19/08/19.
//  Copyright © 2019 Jaisson Monteiro. All rights reserved.
//

import UIKit

class DetailPersonTableViewController: UITableViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var bithYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var homeWorldLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var editedLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var filmsLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var vehiclesLabel: UILabel!
    @IBOutlet weak var starshipsLabel: UILabel!
    
    var person : Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if person == nil {
            Alert.showErrorAlert(message: "Erro ao carregar os dados", in: self) { (alertAction) in
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            self.title =  person?.name
            self.nameLabel.text = "Nome: \(person!.name)"
            self.heightLabel.text = "Altura: \(person!.height)"
            self.massLabel.text = "Massa: \(person!.mass)"
            self.hairColorLabel.text = "Cor do cabelo: \(person!.hair_color)"
            self.skinColorLabel.text = "Cor da pele: \(person!.skin_color)"
            self.eyeColorLabel.text = "Cor dos olhos: \(person!.eye_color)"
            self.bithYearLabel.text = "Nascimento: \(person!.birth_year)"
            self.genderLabel.text = "Genero: \(person!.gender)"
            self.homeWorldLabel.text = "Terra natal: \(person!.homeworld)"
            self.createdLabel.text = "Criado: \(person!.created)"
            self.editedLabel.text = "Editado: \(person!.edited)"
            self.urlLabel.text = "Url: \(person!.edited)"
            self.filmsLabel.text = "Filmes: \(person!.films)"
            self.speciesLabel.text = "Especies: \(person!.species)"
            self.starshipsLabel.text = "Naves espaciais: \(person!.starships)"
            self.vehiclesLabel.text = "Veiculos: \(person!.vehicles)"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
