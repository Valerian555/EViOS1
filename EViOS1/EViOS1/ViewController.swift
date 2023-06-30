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
    @IBOutlet weak var mySwitch: UISwitch!
    var isHidden: Bool = false
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
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
        loginField.keyboardType = .emailAddress
        loginField.textContentType = .emailAddress
        passwordField.textContentType = .password
        
        //fermeture du clavier avec un tap
        let tapOnView = UITapGestureRecognizer(target: view, action:
        #selector(UIView.endEditing))
        view.addGestureRecognizer(tapOnView)
        
        //gestion du chargement
        loader.isHidden = true

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
    
    @IBAction func loginButton(_ sender: Any) {
        startLoading()
        loginVerification()
    }
    
    func incorrectAlertBox() {
        let alert = UIAlertController(title: "ERROR", message: "Une condition n'est pas respectée", preferredStyle:
        .alert)

        //add buttons
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        //afficher
        present(alert, animated: true, completion: nil)
    }
    
    func correctAlertBox(login: String){
        if(mySwitch.isOn){
            //déclarer
            let alert = UIAlertController(title: "Bienvenu \(login)", message: "Vous vous êtes inscrit à la newsletter", preferredStyle:
                    .alert)
            
            //add buttons
            alert.addAction(UIAlertAction(title: "Merci !", style: .default))
            
            //afficher
            present(alert, animated: true, completion: nil)
        } else {
            //déclarer
            let alert = UIAlertController(title: "Bienvenu \(login)", message: "Vous ne vous êtes pas inscrit à la newsletter", preferredStyle:
                    .alert)
            
            //add buttons
            alert.addAction(UIAlertAction(title: "Merci !", style: .default))
            
            //afficher
            present(alert, animated: true, completion: nil)
        }
    }
    
    func startLoading() {
        loader.isHidden = false
        loader.startAnimating()
    }
    
    func loginVerification(){
        DispatchQueue.global(qos: .default).async {
            sleep(3)
            
            DispatchQueue.main.async {
                self.loader.isHidden = true
                
                if let login = self.loginField.text {
                    if !login.isEmpty {
                        if let password = self.passwordField.text {
                            if !password.isEmpty {
                                if login.contains("@") {
                                    if password.count >= 4 {
                                        //toutes conditions remplies
                                        self.correctAlertBox(login: login)
                                    } else {
                                        //mot de passe incorrect
                                        self.incorrectAlertBox()
                                    }
                                } else {
                                    //absence de "@"
                                    self.incorrectAlertBox()
                                }
                            } else {
                                //password vide
                                self.incorrectAlertBox()
                            }
                        }
                    } else {
                        //Login vide
                        self.incorrectAlertBox()
                    }
                }
            }
        }
    }
}

