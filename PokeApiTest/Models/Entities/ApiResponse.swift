//
//  ApiResponse.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit

struct ApiResponse: Codable {

  /// Number Of Pokemons
  var count:Int

  ///URL for Next Query, can be nil or null
  var next:String?

  ///URL for Previous Query, can be nil or null
  var previous:String?

  /// var for Save Pokemones
  var results:[Pokemon]?


}
