//
//  PerfilViewController.swift
//  PokeApiHaroldArias
//
//  Created by MAC08 on 24/11/21.
//

//Imports.
import UIKit

class PerfilViewController: UIViewController {

    //Declarando los Outlets.
    @IBOutlet weak var FirstNameLabel: UILabel!
    @IBOutlet weak var LastNameLabel: UILabel!
    @IBOutlet weak var CellphoneNumberLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!

    //Declarando las variables.
    var user : Users? = nil
    
    //Función viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Rellenar automaticamente los campos con los datos almacenado en nuestro modelo.
        FirstNameLabel.text = user?.firstname
        LastNameLabel.text = user?.lastname
        CellphoneNumberLabel.text = user?.cellphonenumber
        EmailLabel.text = user?.email
    }

    //Función de cerrar sesión.
    @IBAction func CloseSessionTapped(_ sender: Any) {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let firstView = storyboard.instantiateViewController(identifier: "MainViewController") as! ViewController
        firstView.modalPresentationStyle = .fullScreen
        self.present(firstView, animated: true, completion: nil)
    }
    
}
