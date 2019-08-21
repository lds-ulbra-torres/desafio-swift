//
//  Alert.swift
//  Desafio-lds
//
//  Created by Jaisson Monteiro on 21/08/19.
//  Copyright © 2019 Jaisson Monteiro. All rights reserved.
//

import Foundation
import UIKit
class Alert {
    
    static func showErrorAlert(message: String, in view : UIViewController,completionHundler : ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default, handler: completionHundler)
        alert.addAction(button)
        view.present(alert, animated: true, completion: nil)
    }
    
}
