//
//  ConstantansApp.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit

class ConstantansApp: NSObject {

  static let MAX_POKEMON_QUANTITY_FOR_QUERY:Int16 = 50
  static let URL_BASE:String = "https://pokeapi.co/api/v2/"
  static let INITIAL_ENDPOINT_FOR_QUERY_WITH_OFFSET:String = "pokemon?limit=\(MAX_POKEMON_QUANTITY_FOR_QUERY)&offset=0"
  static let URL_ENDPOINT_BASIC_QUERY_POSTFIX = "pokemon"
  static let URL_POKEMON_IMAGE_BASE = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
  static let POSTFIX_POKEMON_IMAGE_URL = ".png"
}
