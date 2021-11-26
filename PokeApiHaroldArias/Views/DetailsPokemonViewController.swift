//
//  DetailsPokemonViewController.swift
//  PokeApiHaroldArias
//
//  Created by MAC08 on 25/11/21.
//

//Imports.
import UIKit

class DetailsPokemonViewController: UIViewController {

    //Declarando Outlets.
    @IBOutlet weak var NamePokemonLabel: UILabel!
    @IBOutlet weak var URLPokemonLabel: UILabel!
    
    //Declaración de variables.
    var results : Result? = nil
    
    //Función viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Cargar los labels con la información de la celda seleccionada.
        NamePokemonLabel.text = results!.name
        URLPokemonLabel.text = results!.url
    }

    //Botón cerrar seción.
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
