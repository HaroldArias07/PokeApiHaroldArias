//
//  SingInViewController.swift
//  PokeApiHaroldArias
//
//  Created by MAC08 on 24/11/21.
//

//Imports.
import UIKit
import Firebase
import FirebaseAuth

class SingInViewController: UIViewController {

    //Declarando los Outlets.
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    //viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Rellenando datos automaticamentes con un usuario ya registrado
        //dentro de la autenticación de Firebase.
        EmailTextField?.text = "harold_joseph_07@hotmail.com"
        PasswordTextField?.text = "123456789"
        
    }
    
    //Función de SingIn.
    @IBAction func SingInAppend(_ sender: Any) {
        
        //Declarando de variables para que tomen como propiedad los datos guardados
        //en los TextFields.
        let email = EmailTextField.text!
        let password = PasswordTextField.text!
                
        //Función de SingIn con Firebase, caso de que el usuario no se encuentre registrado
        //podremos visualizar un mensaje de alerta.
        Auth.auth().signIn(withEmail: email, password: password) { (responseUser, error) in
            if error == nil {
                //Si el usuario se encuentra registrado pasará al siguiente StoryBoard.
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            } else {
                //Generación de la alerta
                let alert = UIAlertController(title: "Error", message: "User or Password incorrect", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
    //Función de botón atras.
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
