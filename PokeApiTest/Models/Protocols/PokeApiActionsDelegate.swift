//
//  PokeApiActionsDelegate.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit
import Alamofire

protocol PokeApiActionsDelegate {

  ///Get Pokemons in A simple query
  func GetPokemons() -> [Pokemon]

  ///Get Pokemons with last Index and Offset
  func GetPokemonsWithIndexAndOffsets(index:Int, offSet:Int) -> [Pokemon]

}
