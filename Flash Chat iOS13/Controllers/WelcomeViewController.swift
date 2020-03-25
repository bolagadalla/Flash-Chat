//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Bola Gadalla on 28/02/20.
//  Copyright © 2020 Bola Gadalla. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleText = K.appName
        var charIndex = 0
        titleLabel.text = ""
        //This is for animation of the app title
        for letters in titleText
        {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIndex), repeats: false) { (Timer) in
                self.titleLabel.text?.append(letters)
            }
            charIndex += 1
        }
       
    }
    

}
