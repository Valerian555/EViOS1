//
//  ViewController.swift
//  EViOS1
//
//  Created by Student08 on 30/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var viewTap: UIView!
    @IBOutlet weak var imageInView: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    
    var isHidden: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //rendre l'image ronde
        userIcon.layer.cornerRadius = userIcon.frame.size.height/2
        userIcon.clipsToBounds = true
        
        //rendre la vue cliquable
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        viewTap.addGestureRecognizer(tapGesture)
        
        //gestion du clavier
        loginField.keyboardType = .default
        loginField.textContentType = .username
        passwordField.textContentType = .password
        
        //fermeture du clavier avec un tap
        let tapOnView = UITapGestureRecognizer(target: view, action:
        #selector(UIView.endEditing))
        view.addGestureRecognizer(tapOnView)

    }
    
    @objc func viewTapped(){
        if(isHidden){
            imageInView.image = UIImage(named: "eye_on_icon")
            passwordField.isSecureTextEntry = false
            isHidden = false
        } else {
            imageInView.image = UIImage(named: "eye_off_icon")
            passwordField.isSecureTextEntry = true
            isHidden = true
        }
    
    }
    

}

