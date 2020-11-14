//
//  Pokemon.swift
//  PokeApiTest
// Struct for match the basic pokemon data needed for pokemon List
//  Created by mac on 11/14/20.
//

import UIKit

struct Pokemon: Codable {

  var url:String
  var id:String?
  var imageUrl:String?
  var name:String
}
