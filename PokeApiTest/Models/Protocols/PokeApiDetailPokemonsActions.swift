//
//  PokeApiDetailPokemonsActions.swift
//  PokeApiTest
//
//  Created by mac on 11/17/20.
//

import UIKit

protocol PokeApiDetailPokemonsActions: NSObject {

  func PopulateDetailPokemon(response:PokemonDetailResponse) -> Void

}
