//
//  SingUpViewController.swift
//  PokeApiHaroldArias
//
//  Created by MAC08 on 24/11/21.
//

//Imports.
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SingUpViewController: UIViewController {
    
    //Declarando los Outlets.
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var CellphoneTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    //Declarando variables.
    //Variable que hace referencia a la base de datos.
    let databaseReference = Database.database().reference()
    
    //viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Almacenando datos en base de datos de Firebase.
    func storeData(user: String, uid: String, firstname: String, lastname: String, cellphone: String) {
        let object:[String: Any] = [
            "id": uid,
            "fistname": firstname as NSObject,
            "lastname": lastname as NSObject,
            "cellphone": cellphone as NSObject,
            "email": user as NSObject,
        ]
        databaseReference.child("Users").child(uid).setValue(object)
    }
    
    //Función de SingUp.
    @IBAction func SingUpTapped(_ sender: Any) {
        
        //Declarando de variables para que tomen como propiedad los datos guardados
        //en los TextFields.
        let firstname = FirstNameTextField.text!
        let lastname = LastNameTextField.text!
        let cellhpone = CellphoneTextField.text!
        let email = EmailTextField.text!
        let password = PasswordTextField.text!
        
        //Función de SingUp con Firebase, si el usuario no existe esta función lo crea, caso contrario
        //si existe o tratamos de enviar un texto no apropiado para el tipo de campo nos saldrá una alerta.
        Auth.auth().createUser(withEmail: email, password: password) { (responseUser, error) in
            if error == nil {
                //Creación del usuario.
                print("The user was created successfully")
                let userFirebase = Auth.auth().currentUser
                let uid = userFirebase?.uid
                self.storeData(user: email, uid: uid!, firstname: firstname, lastname: lastname, cellphone: cellhpone)
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                
            } else {
                //Generación de la alerta.
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
