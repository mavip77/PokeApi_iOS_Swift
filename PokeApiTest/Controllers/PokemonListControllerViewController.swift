//
//  PokemonListControllerViewController.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit

class PokemonListControllerViewController: UIViewController {

  @IBOutlet weak var tableView:UITableView!

 
  var pokemonSelected : Pokemon?

  //For DataSource
  private lazy var listDataSource:PokemonListDataSource = {

    return DataSourceForGetPokemonsQuery()

  }()


  func DataSourceForGetPokemonsQuery() -> PokemonListDataSource {

    return PokemonListDataSource(query: ""){

      [unowned self] in

      self.tableView.reloadData()
    }


  }


  //MARK:- LIFE CICLE APP

  override func viewWillAppear(_ animated: Bool) {
    self.listDataSource.FetchNext()
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      self.tableView.delegate = self
      self.tableView.dataSource = self.listDataSource



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
