//
//  StringOperations.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit

class StringOperations: NSObject {

  func GetPokemonNumber(urlDataAsString:String) -> String {

    var urlData = urlDataAsString

    //Remove last Index
    let removeLast = urlData.popLast()

    //Get index of last '/'
    if let indexbackSlash = urlData.lastIndex(of: "/"){

      return String(urlData[urlData.index(after: indexbackSlash)..<urlData.endIndex])
    }

    return ""

  }

  func TranslateStringToLowerCase(baseString:String) -> String {

    let lowerCasedString = baseString.lowercased()

    return lowerCasedString

  }

}
