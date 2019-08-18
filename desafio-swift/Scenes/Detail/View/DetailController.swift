//
//  DetailController.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol DetailView: AnyObject {
    func startLoading()
    func stopLoading()
    func showMessage(
        icon: Icon,
        text: String,
        sizeIcon: Int,
        backgroundColor: UIColor,
        isButton: Bool,
        titleButton: String)
    func hideMessage()
    
    func displayView(title: String)
    func displayView(height: String)
    func displayView(mass: String)
    func displayView(hair: String)
    func displayView(skin: String)
    func displayView(eye: String)
    func displayView(birthYear: String)
    func displayView(gender: String)
    func displayView(films: String)
    func displayView(species: String)
    func displayView(vehicles: String)
    func displayView(starships: String)
}

class DetailController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairLabel: UILabel!
    @IBOutlet weak var skinLabel: UILabel!
    @IBOutlet weak var eyeLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var filmsLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var vehiclesLabel: UILabel!
    @IBOutlet weak var starshipsLabel: UILabel!
    
    var presenter: DetailPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.present()
    }
}

extension DetailController: DetailView {
    func startLoading() {
        view.displayLoadingIndicator(text: "Loading...", backgroundColor: .white)
    }
    
    func stopLoading() {
        view.dismissLoadingIndicator()
    }
    
    func showMessage(icon: Icon, text: String, sizeIcon: Int, backgroundColor: UIColor, isButton: Bool, titleButton: String) {
        view.displayMessageView(
            icon: icon,
            text: text,
            sizeIcon: sizeIcon,
            backgroundColor: backgroundColor,
            isButton: isButton,
            titleButton: titleButton,
            completion: nil)
    }
    
    func hideMessage() {
        view.dismissMessageView()
    }
    
    func displayView(title: String) {
        self.title = title
    }
    
    func displayView(height: String) {
        heightLabel.text = height
    }
    
    func displayView(mass: String) {
        massLabel.text = mass
    }
    
    func displayView(hair: String) {
        hairLabel.text = hair
    }
    
    func displayView(skin: String) {
        skinLabel.text = skin
    }
    
    func displayView(eye: String) {
        eyeLabel.text = eye
    }
    
    func displayView(birthYear: String) {
        birthYearLabel.text = birthYear
    }
    
    func displayView(gender: String) {
        genderLabel.text = gender
    }
    
    func displayView(films: String) {
        filmsLabel.text = films
    }
    
    func displayView(species: String) {
        speciesLabel.text = species
    }
    
    func displayView(vehicles: String) {
        vehiclesLabel.text = vehicles
    }
    
    func displayView(starships: String) {
        starshipsLabel.text = starships
    }
}
