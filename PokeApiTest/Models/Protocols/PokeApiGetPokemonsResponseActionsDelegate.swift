//
//  PokeApiGetPokemonsResponseActionsDelegate.swift
//  PokeApiTest
//  Protocol for realize actions in Main List View
//  asyncronously after Api get Data
//  Created by mac on 11/14/20.
//

import UIKit

protocol PokeApiGetPokemonsResponseActionsDelegate: class {

  func QueryResultData(pokemons:[Pokemon]?) -> Void
  func QueryResultError(message:String) -> Void

}
