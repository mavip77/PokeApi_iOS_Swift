//
//  PokemonDetailResponse.swift
//  PokeApiTest
//
//  Created by mac on 11/17/20.
//

import UIKit

struct PokemonDetailResponse: Codable {

  var base_experience:Int?
  var height:Int?
  var weight:Int?
  var stats:[StatsDetail]

        // Do any additional setup after loading the view.
    }

struct StatsDetail:Codable{
  var base_stat:Int?
  var effort:Int?
  var statDetail:StatDetail?
}

struct StatDetail:Codable{
  var url:String?
  var name:String?
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


