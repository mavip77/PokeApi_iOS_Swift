//
//  PokemonListControllerViewController.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit

class PokemonListControllerViewController: UIViewController {

  @IBOutlet weak var tableView:UITableView!

  let ApiConnection = PokeApiConnect()

    override func viewDidLoad() {
        super.viewDidLoad()

      self.tableView.delegate = self

      ApiConnection.GetPokemons()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PokemonListControllerViewController : UITableViewDelegate{

}
