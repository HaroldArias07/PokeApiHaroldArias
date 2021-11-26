//
//  PokemonListViewController.swift
//  PokeApiHaroldArias
//
//  Created by MAC08 on 25/11/21.
//

//Imports.
import UIKit

class PokemonListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Declarando Outlets.
    @IBOutlet weak var PokemonListTableView: UITableView!
    
    //Declaración de variables.
    let pokeViewModel = PokeViewModel()
    var results = [Result]()
    
    //Función viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeViewModel.GetPokeApi {
            data in self.results = data
            DispatchQueue.main.async {
                self.PokemonListTableView.reloadData()
            }
        }
        PokemonListTableView.dataSource = self
        PokemonListTableView.delegate = self
    }
    
    //Función encargada del numero de celdas de la tabla.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if results.count == 0 {
            return 1
        } else {
            return results.count
        }
    }
    
    //Función encargada de llenar datos en cada celda de la tabla, por ejemplo solo se especifico que
    //completara el textLabel con el nombre del pokemon.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        if results.count == 0 {
            cell.textLabel?.text = "No titnes SNAPS"
        } else {
            cell.textLabel?.text = results[indexPath.row].name.capitalized
        }
        return cell
    }
    
    //Función encargada de informar al Delegate sobre la selección de la celda.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let results = results[indexPath.row]
        performSegue(withIdentifier: "DetailsPokemon", sender: results)
    }
    
    //Función encargada de pasar toda la información almacenanda al siguiente Storyboard.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsPokemon" {
            let siguienteVC = segue.destination as! DetailsPokemonViewController
            siguienteVC.results = sender as? Result
        }
    }
    
}
