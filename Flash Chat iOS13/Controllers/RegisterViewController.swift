//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Bola Gadalla on 28/02/20.
//  Copyright © 2020 Bola Gadalla. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // Register Users When they press the Register Button
    @IBAction func registerPressed(_ sender: UIButton)
    {
        if let email = emailTextfield.text, let password = passwordTextfield.text
        {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error
                {
                    print(e)
                }
                else
                {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
}
