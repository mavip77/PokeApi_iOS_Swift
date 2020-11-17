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

  var actionsResponseDelegateForDetailPOkemonsView:PokeApiDetailPokemonsActions?

  var StringActions = StringOperations()


  func GetPokemons(queryAsString:String?) -> Void {

    var pokemons : [Pokemon]? = []

    if let query = queryAsString{

      let request = AF.request(query, method: .get, parameters: nil, encoding:URLEncoding(destination: .methodDependent), headers: nil, interceptor: nil, requestModifier: nil)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])


       //works right
      request.responseDecodable(of:ApiResponse.self){
        response in

        print("Response \(response)")

        if let values = response.value{

          // Send Message for Modify last and previos query var in datasource
          self.actionsResponseDelegate?.NextAndPreviosQueriesResult(previousQuery:values.previous , nextQuery: values.next)
          self.actionsResponseDelegate?.QueryResultData(pokemons: values.results)
        }

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

  func GetPokemonSelectedDetailData(urlToPokemonData:String){

    let requestDetailData = AF.request(urlToPokemonData, method: .get, parameters: nil, encoding: URLEncoding(destination: .methodDependent), headers: nil, interceptor: nil, requestModifier: nil)
      .validate(statusCode: 200..<300)
      .validate(contentType: ["application/json"])

    requestDetailData.responseJSON{
      response in

      if let  responseAsString = response.value{
      //  print(responseAsString)

       



        if let object = responseAsString as? [String:Any]{

        //  print(object)

          let base_experience = object["base_experience"] as! Int
          let height = object["height"] as! Int
          let weigth = object["weight"] as! Int
          let stats = object["stats"] as! [Any]

          var statsDetailArray = [StatsDetail]()

          for item in stats {
            let stat = item as! [String:Any]
            print(stat)
            let base_stat = stat["base_stat"] as! Int
            let effor = stat["effort"] as! Int
            let statDict = stat["stat"] as![String:Any]
            let url = statDict["url"] as! String
            let name = statDict["name"] as! String

            let statDetail = StatDetail(url: url, name: name)
            let statsDetail = StatsDetail(base_stat: base_stat, effort: effor, statDetail: statDetail)

            statsDetailArray.append(statsDetail)
            print(name)
          }

          let pokemonDetailResponse = PokemonDetailResponse(base_experience: base_experience, height: height, weight: weigth, stats: statsDetailArray)

          self.actionsResponseDelegateForDetailPOkemonsView?.PopulateDetailPokemon(response: pokemonDetailResponse)
        //  let Abilities = object["abilities"] as! [Abilities]
         // let baseStats = stats["base_stat"] as! Dictionary<String,Int64>

         // print("Las Stats \(Abilities)")
        }




        } else {
        print("JSON is invalid")
        }

     //   let stringModified = self.StringActions.ReplaceCharacterInAresponse(baseString: responseAsString as! String)


      



    }
   /* requestDetailData.responseDecodable(of: Json4Swift_Base.self){
      response in
      print("Response \(response)")
    }
 */

  }

  func GetPokemonsWithIndexAndOffsets(index: Int, offSet: Int) -> Void {

    let pokereturn = [Pokemon]()

  }


}
