//
//  PerfilViewController.swift
//  PokeApiHaroldArias
//
//  Created by MAC08 on 24/11/21.
//

//Imports.
import UIKit
import Firebase
import FirebaseAuth

class PerfilViewController: UIViewController {

    //Declarando los Outlets.
    @IBOutlet weak var UIDLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!

    //Declarando las variables.
    let user = Auth.auth().currentUser
    
    //Función viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Almacenando datos de la autenticación en variables.
        let uid = user?.uid
        let email = user?.email
        
        UIDLabel.text = uid
        EmailLabel.text = email
    }
    
    //Función de cerrar sesión.
    @IBAction func CloseSessionTapped(_ sender: Any) {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let firstView = storyboard.instantiateViewController(identifier: "MainViewController") as! ViewController
        firstView.modalPresentationStyle = .fullScreen
        self.present(firstView, animated: true, completion: nil)
    }
    
}
