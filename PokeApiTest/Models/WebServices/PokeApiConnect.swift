//
//  PokeApiConnect.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit
import Alamofire

class PokeApiConnect: NSObject, PokeApiActionsDelegate {

  let URL_FOR_BASIC_QUERY = ConstantansApp.URL_BASE + ConstantansApp.URL_BASE_BASIC_QUERY_POSTFIX

  func GetPokemons() -> [Pokemon] {
    let request = AF.request(self.URL_FOR_BASIC_QUERY, method: .get, parameters: nil, encoding:URLEncoding(destination: .methodDependent), headers: nil, interceptor: nil, requestModifier: nil)

    request.responseDecodable(of:ApiResponse.self){
      response in

      print("Response \(response)")
    }
    let pokereturn = [Pokemon]()
    return pokereturn
  }

  func GetPokemonsWithIndexAndOffsets(index: Int, offSet: Int) -> [Pokemon] {

    let pokereturn = [Pokemon]()
    return pokereturn
  }


}
