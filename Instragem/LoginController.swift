//
//  LoginController.swift
//  Instragem
//
//  Created by Student on 27/02/2017.
//  Copyright © 2017 LuisCorp. All rights reserved.
//

import Foundation
import UIKit

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a 
    
    }
    
    
    
    @IBOutlet weak var txtUsername: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "showMainMenu", sender: self)
        
    }
    
}
