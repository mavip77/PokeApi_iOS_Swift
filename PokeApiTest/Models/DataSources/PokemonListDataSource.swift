//
//  PokemonListDataSource.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit

class PokemonListDataSource: NSObject {

  ///Delegate For Notifie api response
  weak var delegateApiActions: PokeApiGetPokemonsResponseActionsDelegate?

  ///Var For ApiService Call
  let ApiService = PokeApiConnect()

  /// Var for define pokemons quantity retrieved in a get pokemons query
  let numberOfPokemosRetrieved: Int16 = 25

  var arrayWithPokemons:[Pokemon] = []

  ///Constante for update user gesture scroll down
  var updateManager: () -> ()

  /// Var For Save WebService Query
  var query:String?

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
    self.ApiService.actionsResponseDelegate = self
    // Get Data From WebService
    self.ApiService.GetPokemons()



    /*
    if isFetchingUpdates{
      return
    }
    isFetchingUpdates = true

    let nextQuery:String?
    */

  }


}

extension PokemonListDataSource:PokeApiGetPokemonsResponseActionsDelegate{


  func QueryResultData(pokemons: [Pokemon]?) {

    if let pokemons = pokemons{

      self.arrayWithPokemons = pokemons
      // Update Manager here
        self.updateManager()
    }

  }

  func QueryResultError(message: String) {

    self.arrayWithPokemons = [Pokemon]()
    
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
