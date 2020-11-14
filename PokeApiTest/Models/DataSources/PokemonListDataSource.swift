//
//  PokemonListDataSource.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit

class PokemonListDataSource: NSObject {

  /// Var for define pokemons quantity retrieved in a get pokemons query
  let numberOfPokemosRetrieved: Int16 = 25

  let arrayWithPokemons:[Pokemon] = []

  ///Constante for update user gesture scroll down
  let updateManager: () -> ()

  /// Var For Save WebService Query
  let query:String?

  /// Flag for fetch Updates
  var isFetchingUpdates = false

  ///var with number of pokemons in datasource
  public var count:Int{
    return arrayWithPokemons.count
  }

  public init(query:String, updateManager: @escaping () -> ()){

    self.query = query
    self.updateManager = updateManager

  }

  /// Fetch The next POkemons Array
  public func FetchNext(){

    // Get Data From WebService
    let _Pokemons =

    // Update Manager here
      self.updateManager()
    /*
    if isFetchingUpdates{
      return
    }
    isFetchingUpdates = true

    let nextQuery:String?
    */

  }


}


//MARK:- Table View
extension PokemonListDataSource: UITableViewDataSource{

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

      let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonList_RI") as! PokemonTableViewCell

      let pokemon = arrayWithPokemons[indexPath.row]

    cell.Populate(pokemon : pokemon)

      return cell

  }

}
