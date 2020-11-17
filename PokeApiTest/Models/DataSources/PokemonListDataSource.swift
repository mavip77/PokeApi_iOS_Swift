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

  var arrayWithPokemonsBackup:[Pokemon] = []

  var arrayWithPokemonsSearchResult:[Pokemon] = []

  var pokemon:Pokemon?

  ///Constante for update user gesture scroll down
  var updateManager: () -> ()

  /// Var For Save WebService Query
  var lastQuery:String? = nil

  ///Var For Save Next Query
  var nextQuery:String? = ConstantansApp.URL_BASE + ConstantansApp.INITIAL_ENDPOINT_FOR_QUERY_WITH_OFFSET

  /// Flag for fetch Updates
  var isFetchingUpdates = false

  ///var with number of pokemons in datasource
  public var count:Int{
    return arrayWithPokemons.count
  }




 public init(query:String, updateManager: @escaping () -> ()){


    self.lastQuery = query
    self.updateManager = updateManager

  }

  /// Fetch The next POkemons Array
  public func FetchNext(){

    if isFetchingUpdates{

      return
    }

    isFetchingUpdates = true

    // Reload Array with pokemons if previously has been changed for a search for word action
    if !self.arrayWithPokemonsBackup.isEmpty{
      self.arrayWithPokemons = self.arrayWithPokemonsBackup
    }

    // Review if Next Query 1= nil then realize query
    if let query = self.nextQuery{

      self.ApiService.actionsResponseDelegate = self
      // Get Data From WebService
      self.ApiService.GetPokemons(queryAsString: self.nextQuery) // Change query Firm added Query String

    }else{
      return
    }


    /*
    if isFetchingUpdates{
      return
    }
    isFetchingUpdates = true

    let nextQuery:String?
    */

  }

  ///Function For fecth Pokemons in array When the User
      public func FecthDataWhenUserSearchPokemon(pokemonName:String){

        if arrayWithPokemonsBackup.isEmpty{

          self.arrayWithPokemonsBackup = arrayWithPokemons


        }

        guard !pokemonName.isEmpty else {
          self.arrayWithPokemons = self.arrayWithPokemonsBackup
          self.updateManager()
          return
        }

        self.arrayWithPokemons.removeAll()

        self.arrayWithPokemons = self.arrayWithPokemonsBackup.filter({
          pokemon in
          return pokemon.name.contains(pokemonName)
        })
        self.updateManager()
      }

  func UpdateQueries(nextQuery:String?, previousQuery:String?){

    self.lastQuery = previousQuery
    self.nextQuery = nextQuery

  }

  func UpdatePokemonsArray(pokemons:[Pokemon]?){

    if let pokemons = pokemons{

      self.arrayWithPokemons += pokemons
      // Update Manager here
        self.updateManager()
      self.isFetchingUpdates = false
    }
  }

  func NotifyErrorWhenGetDataFail(message:String){

    // Do Actions With  message Here

    // Clear Array
    self.arrayWithPokemons = [Pokemon]()

  }


}

extension PokemonListDataSource:PokeApiGetPokemonsResponseActionsDelegate{

  func NextAndPreviosQueriesResult(previousQuery: String?, nextQuery: String?) {

    self.UpdateQueries(nextQuery: nextQuery, previousQuery: previousQuery)

  }



  func QueryResultData(pokemons: [Pokemon]?) {

    self.UpdatePokemonsArray(pokemons: pokemons)

  }

  func QueryResultError(message: String) {

    self.NotifyErrorWhenGetDataFail(message: message)

    
  }




}



//MARK:- Table View
extension PokemonListDataSource: UITableViewDataSource{

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

      let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonList_RI") as! PokemonTableViewCell

    //Set Id For a Pokemon

    if arrayWithPokemons[indexPath.row].id == nil{
      arrayWithPokemons[indexPath.row].id = setIdToPokemons(url: arrayWithPokemons[indexPath.row].url)
    }

       pokemon = arrayWithPokemons[indexPath.row]


      cell.Populate(pokemon : pokemon)

      return cell

  }

}

extension PokemonListDataSource{

  func setIdToPokemons(url:String) -> String {

    let stringActions = StringOperations()
    return stringActions.GetPokemonNumber(urlDataAsString: url)

  }
}
