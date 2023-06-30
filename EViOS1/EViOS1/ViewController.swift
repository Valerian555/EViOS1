//
//  ViewController.swift
//  EViOS1
//
//  Created by Student08 on 30/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userIcon: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //rendre l'image ronde
        userIcon.layer.cornerRadius = userIcon.frame.size.height/2
        userIcon.clipsToBounds = true

        

    }
    

}

