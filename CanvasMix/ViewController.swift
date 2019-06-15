//
//  ViewController.swift
//  CanvasMix
//
//  Created by Alejandro Quesada on 4/06/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var btnGoogleSignIn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnGoogleSignIn.addTarget(self, action: #selector(signinUserUsingGoogle(_:)), for: .touchUpInside)
    }
    
    @objc func signinUserUsingGoogle(_ sender: UIButton) {
        if btnGoogleSignIn.title(for: .normal) == "Cerrar Sesión" {
            GIDSignIn.sharedInstance().signOut()
            lblTitle.text = ""
            btnGoogleSignIn.setTitle("Iniciar sesión usando Google", for: .normal)
            
        } else {
            GIDSignIn.sharedInstance().delegate = self
            GIDSignIn.sharedInstance().uiDelegate = self
            GIDSignIn.sharedInstance().signIn()
            UserDefaults.standard.set(true, forKey: "islogged")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Hubo un error durante el acceso ==\(error.localizedDescription)")
        } else {
//            if let gmailUser = user {
//                lblTitle.text = "Estás logueado usando el ID \(gmailUser.profile.email!)"
//                btnGoogleSignIn.setTitle("Cerrar Sesión", for: .normal)
//            }
            performSegue(withIdentifier: "mainSegue", sender: nil)
        }
    }


}

