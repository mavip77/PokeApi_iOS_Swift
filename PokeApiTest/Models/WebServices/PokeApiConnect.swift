//
//  PokeApiConnect.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit
import Alamofire

class PokeApiConnect: NSObject, PokeApiActionsDelegate {
 


  let URL_FOR_BASIC_QUERY = ConstantansApp.URL_BASE + ConstantansApp.URL_ENDPOINT_BASIC_QUERY_POSTFIX

   var actionsResponseDelegate:PokeApiGetPokemonsResponseActionsDelegate?


  func GetPokemons() -> Void {

    var pokemons : [Pokemon]? = []

    let request = AF.request(self.URL_FOR_BASIC_QUERY, method: .get, parameters: nil, encoding:URLEncoding(destination: .methodDependent), headers: nil, interceptor: nil, requestModifier: nil)
      .validate(statusCode: 200..<300)
      .validate(contentType: ["application/json"])


     //works right
    request.responseDecodable(of:ApiResponse.self){
      response in

      print("Response \(response)")

      if let values = response.value{

        self.actionsResponseDelegate?.QueryResultData(pokemons: values.results)
      }

    }

/*
    request.responseData{
      response in

      switch response.result{

        case .success:
          print("validation Ok")

          guard let data = response.data else {
            return
          }

          do {

            let pokeResponse = try JSONDecoder().decode(ApiResponse.self, from: data)

            if let pokemonsData = pokeResponse.results{

              for pokemon in pokemonsData{

                pokemons?.append(pokemon)
              }

              self.actionsResponseDelegate?.QueryResultData(pokemons: pokemons)

            }



          } catch let error as NSError {
            print("Ocurrio un Error \(error.domain), \(error.userInfo)")

            self.actionsResponseDelegate?.QueryResultError(message: "Ocurrio un Error \(error.domain), \(error.userInfo)")
          }

          break



        case let .failure(error):
          print(error)

          self.actionsResponseDelegate?.QueryResultError(message: "Ocurrio un Error \(error), \(error)")

      }


    }
     */


  }

  func GetPokemonsWithIndexAndOffsets(index: Int, offSet: Int) -> Void {

    let pokereturn = [Pokemon]()

  }


}
